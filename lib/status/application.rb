module Status
  # The application environment
  class Application < Joy::Application

    # Call application
    #
    # @param [Hash] env
    #
    # @return [Array]
    # 
    # @api private
    #
    def call(env)
      Action.call(env).to_rack_response
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
      Tilt::Template.new(template_path.join(name).to_s)
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

    # Return asset repository
    #
    # @return [Assets::Repository]
    #
    # @api private
    #
    def asset_repository
      Assets::Repository::Directory.new(root.join('assets'))
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
        asset_repository.compile('stylesheets/screen.sass'),
      )]
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

  end
end
