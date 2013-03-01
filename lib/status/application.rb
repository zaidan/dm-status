module Status
  # The application environment
  class Application < Joy::Application

    # Initialize application
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize(*)
      super
      Status.application = self
    end

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
        if path =~ %r(\A/assets/)
          assets_handler
        elsif path == '/'
          Action::Main
        else
          Action::NotFound
        end

      action.call(request)
    end

    # Return repositories
    #
    # @return [Enumerable<Repository>]
    #
    # @api private
    #
    def repositories
      repository_names.map { |name| Repository.new(name) }
    end
    memoize :repositories

  private

    # Return repository names
    #
    # @return [Enumerable<String>]
    #
    # @api private
    #
    def repository_names
      config.fetch('repository_names')
    end

    # Return asset repository
    #
    # @return [Assets::Repository]
    #
    # @api private
    #
    def asset_repository
      Assets::Repository::Directory.new(Status.root.join('assets'))
    end

    # Return asset environment
    #
    # @return [Assets::Environment]
    #
    # @api private
    #
    def asset_environment
      Assets::Environment::Dynamic.new(asset_rules)
    end

    # Return assets handler
    #
    # @return [Assets::Handler]
    #
    # @api private
    #
    def assets_handler
      Assets::Handler.new(asset_environment, '/assets/')
    end
    memoize :assets_handler

    # Return asset rules
    #
    # @return [Enumerable<Asset::Rule>]
    #
    # @api private
    #
    def asset_rules
      [Assets::Rule::Concat.build(
        'application.css', 
        asset_repository.compile('stylesheets/screen.sass')
      )]
    end

  end
end
