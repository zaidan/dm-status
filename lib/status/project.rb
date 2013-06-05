module Status
  # A dm2 related project
  class Project
    include Adamantium::Flat, Concord.new(:name, :tags)

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
    
    # Return github project url
    #
    # @return [String]
    #
    # @api private
    #
    def github_url
      "https://github.com/#{name}"
    end
    memoize :github_url

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
    def rubygems_url
      "https://rubygems.org/gems/#{short_name}"
    end
    memoize :rubygems_url

    # Return rubygems image src
    #
    # @return [String]
    #
    # @api private
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
      "https://api.travis-ci.org/repo/#{name}"
    end
    memoize :travis_api_url

    # Return travis status href
    #
    # @return [String]
    #
    # @api private
    #
    def travis_status_url
      "https://travis-ci.org/#{name}"
    end
    memoize :travis_status_url

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
    def codeclimate_status_url
      "https://codeclimate.com/github/#{name}"
    end
    memoize :codeclimate_status_url

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
    def gemnasium_status_url
      "https://gemnasium.com/#{name}"
    end
    memoize :gemnasium_status_url

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

    # Return tags
    #
    # @return [Enumerable<Tag>]
    #
    # @api private
    #
    def tags
      @tags.map { |tag| Tag.new(:name => tag) }
    end
    memoize :tags

    # Check if project has tag with given name
    #
    # @return [true]
    #   if project has tag with given name
    #
    # @return [false]
    #   otherwise
    #
    # @api private
    #
    def has_tag?(name)
      tags.any?{ |tag| tag.name == name }
    end
  end
end
