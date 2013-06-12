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
      Router.new(request).route(self)
    end

    # Return projects
    #
    # @return [Enumerable<Project>]
    #
    # @api private
    #
    def projects
      config.fetch('projects').map do |project|
        Project.new(
          project.fetch('name'),
          project.fetch('tags', [])
        )
      end
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
    
    # Route request to actions
    class Router
      include Adamantium::Flat, Concord.new(:request)
      
      # Route request
      # 
      # @param [Object] object
      #
      # @return [Class]
      #
      # @api private
      # 
      def route(object)
        action.call(object, request)
      end

    private
      
      # Return Action class
      # 
      # @return [Class]
      #
      # @api private
      # 
      def action
        case path_info
        when /\A\/assets\//
            Status::ASSET_HANDLER
        when '/'
            Action::Main
        else
          Action::NotFound
        end
      end
      
      # Return request path info
      # 
      # @return [String]
      #
      # @api private
      # 
      def path_info 
        request.path_info
      end
      memoize :path_info


      # Return requery params hash
      # 
      # @return [Hash]
      #
      # @api private
      # 
      def query_params_hash
        request.query_params_hash
      end
      memoize :query_params_hash
    end
  end
end
