module Status
  # Base class for template rendering contexts
  class Context

    # Render context
    #
    # @return [HTML::Fragment]
    #
    # @api private
    #
    def self.render(*args)
      template = Status.template(self::TEMPLATE)
      context = new(*args)
      Joy::Renderer.render(template, context)
    end

    # Page rendering context
    class Page < self
      include Adamantium::Flat, Anima.new(:title, :meta_description, :content)
      TEMPLATE = 'layout.haml'.freeze

      DEFAULTS = IceNine.deep_freeze(
        :title            => 'DataMapper2 - Status',
        :meta_description => 'The DataMapper2 project status page'
      )

      # Return new object 
      #
      # @param [Hash] attributes
      #
      # @return [Page]
      #
      # @api private
      #
      def self.new(attributes)
        super(DEFAULTS.merge(attributes))
      end
    end

    # Main context
    class Main < self
      include Adamantium::Flat, Anima.new(:projects)
      TEMPLATE = 'main.haml'.freeze
    end

    # Context for not found template
    class NotFound < self
      include Adamantium::Flat, Composition.new(:request)
      TEMPLATE = 'not_found.haml'.freeze
    end

  end

  # Abstract base class for actions
  class Action
    include Adamantium::Flat, Joy::Action

  private

    # Return page response
    #
    # @param [Hash] attributes
    #
    # @return [Response]
    #
    # @api private
    #
    def page_response(attributes)
      content = Context::Page.render(attributes)
      Response::HTML.build(content.to_s)
    end

    # Action to handle unhandled requests
    class NotFound < self

      # Return response
      #
      # @return [Response]
      #
      # @api private
      #
      def response
        content  = Context::NotFound.render(request)
        page_response(
          :title            => 'Not Found', 
          :content          => content,
          :meta_description => ''
        ).with_status(Response::Status::NOT_FOUND)
      end
      memoize :response

    end

    # Main action
    class Main < self

      # Return response
      #
      # @return [Response]
      #
      # @api private
      #
      def response
        content = Context::Main.render(:projects => projects)
        page_response(:content => content)
      end

    private

      # Return projects
      #
      # @return [Enumerable<Repository>]
      #
      # @api private
      #
      def projects
        application.projects
      end

    end
  end
end
