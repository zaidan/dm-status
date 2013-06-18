module Status
  # Update status page from config.yml as index.html with assets
  class Builder
    class Updater < self
    
    private

      # Return asset environment index
      #
      # @return [Hash<Rule>]
      #
      # @api private
      #
      def asset_env_index
        ASSET_ENVIRONMENT.index.reject do |name|
          name.end_with?('.css')
        end
      end
    end
  end
end
