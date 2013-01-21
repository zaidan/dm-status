module Status
  # Abstract base class for github api document presenters
  class Presenter
    include AbstractType, Composition.new(:subject)

    ALLOWED_KEYS = [:as].freeze

    # Define accessors
    #
    # @param [Hash]
    #
    # @api private
    #
    def self.access(name, options)
      overflow = options.keys - ALLOWED_KEYS
      unless overflow.empty?
        raise "Unsupported keys: #{overflow.inspect}"
      end

      access_name = options.fetch(:as, name)
    
      define_method(access_name) do
        subject.public_send(name)
      end
    end
  end
end
