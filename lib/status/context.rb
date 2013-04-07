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
      include Adamantium::Flat, Anima.new(:title, :heading, :meta_description, :content)
      TEMPLATE = 'layout.haml'.freeze
    end

    # Main context
    class Main < self
      include Adamantium::Flat, Anima.new(:projects)
      TEMPLATE = 'main.haml'.freeze
    end

    # Context for not found template
    class NotFound < self
      include Adamantium::Flat, Concord.new(:request)
      TEMPLATE = 'not_found.haml'.freeze
    end

  end
end
