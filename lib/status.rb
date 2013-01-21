require 'anima'
require 'assets'
require 'response'
require 'joy'
require 'susy'

module Status

  # Return application
  #
  # @return [Stoelting::Application]
  #
  # @api private
  #
  def self.application
    @application ||= Application.new(Pathname.new(__FILE__).parent.parent, 'status')
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

require 'status/application'
require 'status/repository'
require 'status/action'
