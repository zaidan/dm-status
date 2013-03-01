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
        if path =~ %r(\A/assets/)
          Assets::Handler.new(asset_environment, '/assets/')
        elsif path == '/'
          Action::Main
        else
          Action::NotFound
        end

      action.call(request)
    end

    # Return repository names
    #
    # @return [Enumerable<String>]
    #
    # @api private
    #
    def repository_names
      config.fetch('repository_names')
    end

    # Return template for name
    #
    # @param [String] name
    #
    # @return [Tilt::Template]
    # 
    # @api private
    #
    def template(name)
      Tilt.new(template_path.join(name).to_s)
    end

    # Return template path
    #
    # @return [Pathname]
    #
    # @api private
    #
    def template_path
      root.join('templates')
    end
    memoize :template_path

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

  end
end
