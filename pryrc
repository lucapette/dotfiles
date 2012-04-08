def require_without_bundler gem
  gem_path = Dir.glob("#{Gem.path.first}/gems/#{gem}*/lib").first
  $LOAD_PATH << gem_path
  require gem
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

  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.clear_active_connections!

  class Class
    def core_ext
      self.instance_methods.map {|m| [m, self.instance_method(m).source_location] }.select {|m| m[1] && m[1][0] =~/activesupport/}.map {|m| m[0]}.sort
    end
  end

  require_without_bundler 'hirb'

  # https://github.com/cldwalker/hirb/issues/46#issuecomment-1870823
  Pry.config.print = proc do |output, value|
    Hirb::View.view_or_page_output(value) || Pry::DEFAULT_PRINT.call(output, value)
  end

  Hirb.enable
end
