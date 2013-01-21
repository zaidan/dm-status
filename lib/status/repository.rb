module Status

  # A dm-2 related GIT repository (not a dm-2 stuff thing, sorry *g*)
  class Repository
    include Adamantium::Flat, Composition.new(:identifier)

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

    # Return repository name
    #
    # @return [String]
    #
    # @api private
    #
    def name
      identifier.split('/', 2).last
    end

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

    # Return travis status href
    #
    # @return [String]
    #
    # @api private
    #
    def travis_status_href
      "https://travis-ci.org/#{identifier}"
    end
    memoize :travis_status_href

    # Return travis image src
    #
    # @return [String]
    #
    # @api private
    #
    def travis_image_src
      "https://travis-ci.org/#{identifier}.png?branch=master"
    end
    memoize :travis_image_src

    # Return gemnasium status href
    #
    # @return [String]
    #
    # @api private
    #
    def gemnasium_status_href
      "https://gemnasium.com/#{identifier}"
    end
    memoize :gemnasium_status_href

    # Return gemnasium image src
    #
    # @return [String]
    #
    # @api private
    #
    def gemnasium_image_src
      "https://gemnasium.com/#{identifier}.png"
    end
    memoize :gemnasium_image_src

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
