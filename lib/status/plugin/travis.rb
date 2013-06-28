module Status
  class Plugin
    # Plugin for Travis
    class Travis < self
      # Return url
      #
      # @return [String]
      #
      # @api private
      #
      def url
        "https://api.travis-ci.org/#{project_name}"
      end
      memoize :url

      # Return image source
      #
      # @return [String]
      #
      # @api private
      #
      def image_src
        "https://travis-ci.org/#{project_name}.png?branch=master"
      end
      memoize :image_src
    end
  end
end
