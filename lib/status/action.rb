module Status
  # The single action that poweres status.datamapper.org
  class View
    include Adamantium::Flat, Anima.new(:feed, :repositories)
  end

  class Action
    include Joy::Action

    # Return response
    #
    # @return [Array]
    #   rack compatible response
    #
    # @api private
    #
    def response
      view = View.new(
        :feed         => feed,
        :repositories => repositories,
      )
      template = Status.application.template('application.haml')
      Response::HTML.build(Joy::Renderer.render(template, view).to_s)
    end

  private

    def feed
      []
    end

    def repositories
      []
    end

  end
end
