module Status
  # A dm2 related project
  class Project
    include Adamantium::Flat, Concord.new(:name, :tag_names)

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

    # Return plugins
    #
    # @return [Enumerable<Plugin>]
    #
    # @api private
    #
    def plugins
      Plugin.descendants.map { |plugin| plugin.new(name, short_name) }
    end
    memoize :plugins

    # Return tags
    #
    # @return [Enumerable<Tag>]
    #
    # @api private
    #
    def tags
      tag_names.map { |tag| Tag.new(:name => tag) }
    end
    memoize :tags
  end
end
