# vim FTW
Pry.config.editor = 'vim'

# Toys methods
# See https://gist.github.com/807492
def Array.toy(n=10, &block)
  block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
end

def Hash.toy(n=10)
  Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr}).to_h
end

if defined?(Rails) && Rails.env
  require 'logger'

  if defined?(ActiveRecord)
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.clear_active_connections!
  end

  Sequel::Model.db.loggers << Logger.new(STDOUT) if defined?(Sequel)
end
