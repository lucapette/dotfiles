require 'rubygems'

# https://github.com/carlhuda/bundler/issues/183#issuecomment-1149953
if defined?(::Bundler)
  global_gemset = ENV['GEM_PATH'].split(':').grep(/ruby.*@global/).first
  if global_gemset
    all_global_gem_paths = Dir.glob("#{global_gemset}/gems/*")
    all_global_gem_paths.each do |p|
      gem_path = "#{p}/lib"
      $LOAD_PATH << gem_path
    end
  end
end

%w{yaih wirble map_by_method sketches}.each {|gem| require gem }

# edit irb lines from vim
Sketches.config :editor => 'vim'

require 'irb/completion'
require 'irb/ext/save-history'

# adds readline functionality
IRB.conf[:USE_READLINE] = true
# auto indents suites
IRB.conf[:AUTO_INDENT] = true
# where history is saved
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
# how many lines to save
IRB.conf[:SAVE_HISTORY] = 1000

# don't save duplicates
IRB.conf[:AT_EXIT].unshift Proc.new {
    no_dups = []
    Readline::HISTORY.each_with_index { |e,i|
        begin
            no_dups << e if Readline::HISTORY[i] != Readline::HISTORY[i+1]
        rescue IndexError
        end
    }
    Readline::HISTORY.clear
    no_dups.each { |e|
        Readline::HISTORY.push e
    }
}

# wirble configuration, using only colours
Wirble.init(:skip_prompt => true, :skip_history => true,:init_colors=>true)

# adding my colours of choice to defaults
colors = Wirble::Colorize.colors.merge({
    # set the comma colour to blue
    :symbol => :light_green,
    :symbol_prefix => :light_green
})

Wirble::Colorize.colors = colors

# method the return the methods not present on basic objects, good for
# investigations
class Object
    def interesting_methods
        (self.methods - Object.instance_methods).sort
    end
end

# toys methods to play with.
# Stealed from https://gist.github.com/807492
class Array
    def self.toy(n=10,&block)
        block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
    end
end

class Hash
    def self.toy(n=10)
        Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
    end
end

# detects a rails console, cares about version
def rails?(*args)
    version=args.first
    v2 = ($0 == 'irb' && ENV['RAILS_ENV'])
    v3 = ($0 == 'script/rails' && Rails.env)
    version == 2 ? v2 : version == 3 ? v3 : v2 || v3
end

# loading rails configuration if it is running as a rails console
load File.dirname(__FILE__) + '/.railsrc' if rails?

# my irb is polite
IRB.conf[:AT_EXIT] << Proc.new {puts "bye-bye"}
