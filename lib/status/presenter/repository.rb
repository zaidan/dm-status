module Status
  class Presenter
    # Presenter for repository
    class Repository < self

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
