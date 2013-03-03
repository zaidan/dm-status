module Status
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
