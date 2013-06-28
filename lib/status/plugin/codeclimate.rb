module Status
  class Plugin
    # Plugin for Codeclimate
    class Codeclimate < self
      # Return url
      #
      # @return [String]
      #
      # @api private
      #
      def url
        "https://codeclimate.com/github/#{project_name}"
      end
      memoize :url

      # Return image source
      #
      # @return [String]
      #
      # @api private
      #
      def image_src
        "https://codeclimate.com/github/#{project_name}.png"
      end
      memoize :image_src
    end
  end
end
