require 'rubygems'

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

#Wirble config
require 'wirble'
Wirble.init(:skip_prompt => true, :skip_history => true,:init_colors=>true)

# getting the default colors and adding mine 
colors = Wirble::Colorize.colors.merge({
    # set the comma color to blue
    :symbol => :light_green,
    :symbol_prefix => :light_green
})  

Wirble::Colorize.colors = colors

# Return only the methods not present on basic objects
class Object
    def interesting_methods
        (self.methods - Object.new.methods).sort
    end
end

load File.dirname(__FILE__) + '/.railsrc' if ($0 == 'irb' && ENV['RAILS_ENV']) || ($0 == 'script/rails' && Rails.env)
