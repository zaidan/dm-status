module Status
  # A cache for remote urls with no purging strategy as maximum amount 
  # of cached objects is fixed and small
  class Cache
    # Timeout in seconds
    TIMEOUT = 60

    # An cached item with its timestamp
    class Item
      include Adamantium::Flat, Equalizer.new(:timestamp, :object)

      # Return time
      #
      # @return [Time]
      #
      # @api private
      #
      attr_reader :timestamp

      # Return object
      #
      # @return [Object]
      #
      # @api private
      #
      attr_reader :object

      # Test if item is fresh
      #
      # @return [true]
      #   if item is fresh
      #
      # @return [false]
      #   otherwise
      #
      # @api private
      #
      def fresh?
        (Time.now - timestamp) < Cache::TIMEOUT
      end

    private

      # Initalize object
      #
      # @param [Object] object
      #
      # @return [undefined]
      #
      # @api private
      #
      def initialize(object)
        @timestamp, @object = Time.now, object
      end
    end

    # Fetch object from cache or yield
    #
    # @param [String] url
    #
    # @return [Object]
    #
    # @api private
    #
    def fetch(url)
      item = fresh(url)
      item ||= yield
      store(url, item)
      item.object
    end

  private

    # Initialize object
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize
      @cache = {}
    end

    # Return item for url if it is fresh
    #
    # @param [String] url
    #
    # @return [Item]
    #   if found and fresh
    #
    # @return [nil]
    #   otherwise
    #
    # @api private
    #
    def fresh(url)
      item = @cache.fetch(url) { return }
      item if item.fresh?
    end

    # Store object under url
    #
    # @param [String] url
    # @param [Object] object
    #
    # @return [undefined]
    #
    # @api private
    #
    def store(url, object)
      @cache[url]=Item.new(object)
    end
  end
end
