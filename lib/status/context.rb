module Status
  # Base class for template rendering contexts
  class Context
    include AbstractType

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
end
