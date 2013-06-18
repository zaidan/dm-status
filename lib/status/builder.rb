module Status
  # Build status page from config.yml as index.html with assets
  class Builder
    include Adamantium::Flat, Concord.new(:dir)

    # Build page
    #
    # @return [self]
    #
    # @api private
    #
    def build
      write_index_page
      create_assets_dir
      compile_assets
    end

  private

    # Return path
    #
    # @return [Pathname]
    #
    # @api private
    #
    def path
      Pathname.new(dir)
    end
    memoize :path


    # Return application
    #
    # @return [Application]
    #
    # @api private
    #
    def application
      Application.build_from_config_path(path.join('config.yml'))
    end
    memoize :application

    # Return main content
    #
    # @return [String]
    #
    # @api private
    #
    def content
      Context::Main.render(:projects => application.projects)
    end
    memoize :content

    # Return index page content
    #
    # @return [String]
    #
    # @api private
    #
    def index_page
      Context::Page.render(application.page_attributes.merge(:content => content)).to_s
    end
    memoize :index_page

    # Write index page to file
    #
    # @return [self]
    #
    # @api private
    #
    def write_index_page
      File.write(path.join('index.html'), index_page)

      self
    end

    # Create assets dir
    #
    # @return [self]
    #
    # @api private
    #
    def create_assets_dir
      FileUtils.mkdir_p path.join(assets_prefix)

      self
    end

    # Return assets prefix
    #
    # @return [String]
    #
    # @api private
    #
    def assets_prefix
      'assets/'
    end

    # Return asset environment index
    #
    # @return [Hash<Rule>]
    #
    # @api private
    #
    def asset_env_index
      ASSET_ENVIRONMENT.index
    end
    memoize :asset_env_index

    # Compile assets
    #
    # @return [self]
    #
    # @api private
    #
    def compile_assets
      asset_env_index.each do |name, rule|
        File.write(path.join(assets_prefix, name), rule.body)
      end

      self
    end
  end
end
