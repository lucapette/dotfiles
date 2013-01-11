def require_without_bundler gem
  _gem_path = Dir.glob("#{Gem.path.grep(/global$/).first}/gems/#{gem}*/lib").first
  if _gem_path
    $LOAD_PATH << _gem_path
    require gem
  else
    puts "Please put #{gem} in your global"
  end
end

# vim FTW
Pry.config.editor = 'vim'

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

if defined?(Rails) && Rails.env
  require 'logger'

  if defined?(ActiveRecord)
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.clear_active_connections!
  end

  if defined?(DataMapper)
    DataMapper::Logger.new($stdout, :debug)
  end

  require_without_bundler 'hirb'

  if defined?(Hirb)
    # https://github.com/cldwalker/hirb/issues/46#issuecomment-1870823
    Pry.config.print = proc do |output, value|
      Hirb::View.view_or_page_output(value) || Pry::DEFAULT_PRINT.call(output, value)
    end

    Hirb.enable
  end
end
