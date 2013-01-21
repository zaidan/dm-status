module Status
  # The single action that poweres status.datamapper.org
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
      View.new(
        :feed         => feed,
        :repositories => repositories,
      )
      Template.new('application.html').render(view)
      Response::HTML.build()
    end

  end
end
