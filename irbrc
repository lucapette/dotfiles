require 'rubygems'
require 'wirble'
Wirble.init
Wirble.colorize

load File.dirname(__FILE__) + '/.railsrc' if ($0 == 'irb' && ENV['RAILS_ENV']) || ($0 == 'script/rails' && Rails.env)
