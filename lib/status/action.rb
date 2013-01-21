module Status
  class View

    class Page < self
      include Adamantium::Flat, Anima.new(:title, :meta_description, :content)
    end

    class Main < self
      include Adamantium::Flat, Anima.new(:repositories)
    end

    class NotFound < self
      include Adamantium::Flat, Composition.new(:request)
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
      view     = View::Page.new(attributes)
      template = Status.application.template('layout.haml')
      content  = Joy::Renderer.render(template, view)
      Response::HTML.build(content.to_s)
    end

    class NotFound < self

      # Return response
      #
      # @return [Array]
      #   rack compatible response
      #
      # @api private
      #
      def response
        view     = View::NotFound.new(request)
        template = Status.application.template('not_found.haml')
        content  = Joy::Renderer.render(template, view)
        page_response(
          :title            => 'NotFound', 
          :content          => content,
          :meta_description => ''
        ).with_status(404)
      end

    end

    class Main < self

      # Return response
      #
      # @return [Array]
      #   rack compatible response
      #
      # @api private
      #
      def response
        view = View::Main.new(
          :repositories => Status.application.repositories,
        )
        template = Status.application.template('main.haml')
        content  = Joy::Renderer.render(template, view)
        page_response(
          :title            => 'DataMapper2 - Status', 
          :content          => content,
          :meta_description => 'The DataMapper2 Project-Status Page'
        ).with_status(404)
      end

    end
  end
end
