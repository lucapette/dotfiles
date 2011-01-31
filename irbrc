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

require_without_bundler 'map_by_method'

# Irb completion 
require 'irb/completion'
# Save irb sessions to history file
require 'irb/ext/save-history'

# Adds readline functionality
IRB.conf[:USE_READLINE] = true
# Auto indents suites
IRB.conf[:AUTO_INDENT] = true
# Where history is saved
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
# How many lines to save
IRB.conf[:SAVE_HISTORY] = 1000

# wirble configuration, using only colours
require_without_bundler 'wirble'
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
        (self.methods - Object.new.methods).sort
    end
end

# loading rails configuration if it is running as a rails console
load File.dirname(__FILE__) + '/.railsrc' if ($0 == 'irb' && ENV['RAILS_ENV']) || ($0 == 'script/rails' && Rails.env)
