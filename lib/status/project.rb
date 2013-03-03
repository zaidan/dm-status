module Status
  # A dm2 related project
  class Project
    include Adamantium::Flat, Composition.new(:name)

    # Return github api url
    #
    # @return [String]
    #
    # @api private
    #
    def github_api_url
      "https://api.github.com/repo/#{name}"
    end
    memoize :github_api_url
    
    # Return github href
    #
    # @return [String]
    #
    # @api private
    #
    def github_href
      "https://api.github.com/#{name}"
    end
    memoize :github_href

    # Return short repository name
    # 
    # @return [Strings]
    #
    # @api private
    #
    def short_name
      name.split('/', 2).last
    end
    memoize :short_name

    # Return rubygems url
    #
    # @return [String]
    #
    # @api private
    #
    def rubygems_href
      "https://rubygems.org/gems/#{name}"
    end
    memoize :rubygems_href

    # Return rubygems image src
    #
    # @return [String]
    #
    # @api privae
    #
    def rubygems_image_src
      "https://badge.fury.io/rb/#{short_name}.png"
    end
    memoize :rubygems_image_src

    # Return travis api rul
    #
    # @return [String]
    #
    # @api private
    #
    def travis_api_url
      "https://api.github.com/repo/#{name}"
    end
    memoize :travis_api_url

    # Return travis status href
    #
    # @return [String]
    #
    # @api private
    #
    def travis_status_href
      "https://travis-ci.org/#{name}"
    end
    memoize :travis_status_href

    # Return travis image src
    #
    # @return [String]
    #
    # @api private
    #
    def travis_image_src
      "https://travis-ci.org/#{name}.png?branch=master"
    end
    memoize :travis_image_src

    # Return codeclimate status href
    #
    # @return [String]
    #
    # @api private
    #
    def codeclimate_status_href
      "https://codeclimate.com/github/#{name}"
    end
    memoize :codeclimate_status_href

    # Return gemnasium image src
    #
    # @return [String]
    #
    # @api private
    #
    def codeclimate_image_src
      "https://codeclimate.com/github/#{name}.png"
    end
    memoize :codeclimate_image_src

    # Return gemnasium status href
    #
    # @return [String]
    #
    # @api private
    #
    def gemnasium_status_href
      "https://gemnasium.com/#{name}"
    end
    memoize :gemnasium_status_href

    # Return gemnasium image src
    #
    # @return [String]
    #
    # @api private
    #
    def gemnasium_image_src
      "https://gemnasium.com/#{name}.png"
    end
    memoize :gemnasium_image_src
  end
end
