require 'rubygems'

# inspired by https://gist.github.com/794915
# I've changed it a bit, it works fine for me now
# but i'm still searching for a better solution
def require_without_bundler(*gems)
    unless defined?(::Bundler)
        gems.each { |g| require g }
        return
    end
    Dir.glob("#{Gem.path.first}/gems/*").map { |gem_path| 
        gem_name=File.basename(gem_path).gsub(/-(\d\.?)+$/,'')
        if gems.include?(gem_name)
            $LOAD_PATH << "#{gem_path}/lib"
            require gem_name
        end
    }
end

%w{wirble map_by_method}.each {|gem| require_without_bundler gem }

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

# toy array
def toy_a(n=10,&block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
end

# toy hash
def toy_h(n=10)
    Hash[a(n).zip(a(n){|c| (96+(c+1)).chr})]
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
