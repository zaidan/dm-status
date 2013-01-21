module Status
  class Presenter
    # A project repositroy
    class Repository < self

      # A github project repository
      class Github < self

        # Return href
        #
        # @return [String] href
        #
        # @api private
        #
        access(:html_url, :as => :href)

      end
    end
  end
end
