require 'rubygems'
require 'wirble'
Wirble.init
Wirble.colorize

if ENV['RAILS_ENV']
    load File.dirname(__FILE__) + '/.railsrc'
end
