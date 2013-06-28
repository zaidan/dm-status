module Status
  class Plugin
    # Plugin for Gemnasium
    class Gemnasium < self
      # Return url
      #
      # @return [String]
      #
      # @api private
      #
      def url
        "https://gemnasium.com/#{project_name}"
      end
      memoize :url

      # Return image source
      #
      # @return [String]
      #
      # @api private
      #
      def image_src
        "https://gemnasium.com/#{project_name}.png"
      end
      memoize :image_src
    end
  end
end
