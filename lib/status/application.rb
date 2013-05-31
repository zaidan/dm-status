module Status
  # The application environment
  class Application < Joy::Application

    # Call application
    #
    # @param [Request] request
    #
    # @return [Array]
    # 
    # @api private
    #
    def call(request)
      path = request.path_info

      action =
        case path
        when /\A\/assets\//
          ASSET_HANDLER
        when '/'
          Action::Main
        else
          Action::NotFound
        end

      action.call(self, request)
    end

    # Return projects
    #
    # @return [Enumerable<Project>]
    #
    # @api private
    #
    def projects
      config.fetch('projects').map { |name| Project.new(name) }
    end
    memoize :projects

    # Return team members
    #
    # @return [Enumerable<Members>]
    #
    # @api private
    #
    def members
      config.fetch('team').map do |member|
        Member.new(
          :name             => member.fetch('name'),
          :nick             => member.fetch('nick'),
          :github_username  => member.fetch('github'),
          :twitter_username => member['twitter'],
          :url              => member['url']
        )
      end
    end
    memoize :members

    # Return page attributes
    #
    # @return [Hash]
    #
    # @api private
    #
    def page_attributes
      config.fetch('page').each_with_object({}) do |(key, value), hash|
        hash[key.to_sym] = value
      end
    end
    memoize :page_attributes

    # Return sponsors
    #
    # @return [Enuemrable<Sponsor>]
    #
    # @api private
    #
    def sponsors
      config.fetch('sponsors').map do |sponsor|
        Sponsor.new(
          :name     => sponsor.fetch('name'),
          :url      => sponsor.fetch('url'),
          :logo     => sponsor['logo'],
          :markdown => sponsor['markdown']
        )
      end
    end
    memoize :sponsors
  end
end
