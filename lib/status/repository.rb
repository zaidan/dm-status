module Status

  # A dm-2 related GIT repository (not a dm-2 stuff thing, sorry *g*)
  class Repository
    include Equalizer.new(:identifier)

    # Return identifier
    #
    # @return [Status]
    #
    # @api private
    #
    attr_reader :identifier

    # Initialize object
    #
    # @param [String] identifier
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize(identifier)
      @identifier = identifier
    end

    # Return github api url
    #
    # @return [Status]
    #
    # @api private
    #
    def github_api_url
      "https://api.github.com/repo/#{identifier}"
    end
    memoize :github_api_url

    # Return travis api rul
    #
    # @return [Status]
    #
    # @api private
    #
    def travis_api_url
      "https://api.github.com/repo/#{identifier}"
    end
    memoize :travis_api_url


    # Return current github status
    #
    # @return [Presenter::Repository::Github]
    #
    # @api private
    #
    def github_status
      Status.fetch(github_api_url, Presenter::Repository::Github)
    end

    # Return current travis status
    #
    # @return [Presenter::Prepository::Travis]
    #
    # @api private
    #
    def travis_status
      Status.fetch(travis_api_url, Presenter::Repository::Travis)
    end
  end
end
