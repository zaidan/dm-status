module Status
  class Plugin
    # Plugin for Rubygems
    class Rubygems < self
      # Return url
      #
      # @return [String]
      #
      # @api private
      #
      def url
        "https://rubygems.org/gems/#{project_short_name}"
      end
      memoize :url

      # Return image source
      #
      # @return [String]
      #
      # @api private
      #
      def image_src
        "https://badge.fury.io/rb/#{project_short_name}.png"
      end
      memoize :image_src
    end
  end
end
