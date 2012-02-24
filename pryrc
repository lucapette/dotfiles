# vim FTW
Pry.config.editor = "gvim --nofork"

# My pry is polite
Pry.config.hooks.add_hook :after_session, :say_bye do
  puts "bye-bye" if Pry.active_sessions == 1
end

# Prompt with ruby version
Pry.prompt = [proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

# Toys methods
# See https://gist.github.com/807492
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end

# loading rails configuration if it is running as a rails console
load File.dirname(__FILE__) + '/.rails-rc' if defined?(Rails) && Rails.env
