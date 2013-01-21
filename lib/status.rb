require 'pathname'

module Status

  # Return project root
  #
  # @return [Pathname]
  #
  # @api private
  #
  def self.root
    @root ||= Pathname.new(File.dirname(__FILE__)).parent.parent
  end

  # Return configuration
  #
  # @return [Hash]
  #
  # @api private
  #
  def self.config
    @config = YAML.load_file(pathname.join('config.yml'))
  end

  # Return repository names
  #
  # @return [Enumerable<String>]
  #
  # @api private
  #
  def self.repository_names
    @config.fetch('repository_names')
  end

  # Return repositories
  #
  # @return [Enumerable<Repository>]
  #
  # @api private
  #
  def self.repositories
    @repositories ||= repository_names.map { |name| Repository.new(name) }
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

require 'status/presenter/repository'
