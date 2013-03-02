require 'anima'
require 'assets'
require 'response'
require 'joy'
require 'susy'
require 'compass'

Sass.load_paths.concat(Compass::Configuration::Data.new('foo').sass_load_paths)

# Namespace for dm-status
module Status

  # Return template path
  #
  # @return [Pathname]
  #
  # @api private
  #
  def self.template_path
    @template_path ||= root.join('templates').freeze
  end

  # Return template for name
  #
  # @param [String] name
  #
  # @return [Tilt::Template]
  # 
  # @api private
  #
  def self.template(name)
    Tilt.new(template_path.join(name).to_s)
  end

  # Return root directory
  #
  # @return [Pathname]
  #
  # @api private
  #
  def self.root
    @root ||= Pathname.new(__FILE__).parent.parent
  end

  # Fetch resource from cache or locally
  #
  # @param [String] url
  #   the url to fetch
  #
  # @param [Class:Presenter] presenter
  #   the presenter to instantiate on new data
  #
  # @return [Presenter]
  #   presenter instance
  #   
  # @api private
  #
  def self.fetch(url, presenter)
    cache.fetch(url) do 
      Request.run(url, presenter)
    end
  end

  # Return cache
  #
  # @return [Cache]
  #
  # @api private
  #
  def self.cache
    @cache ||= Cache.new
  end

end

require 'status/cache'
require 'status/application'
require 'status/repository'
require 'status/action'
