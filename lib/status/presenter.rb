module Status
  # Abstract base class for github api document presenters
  class Presenter
    include AbstractType, Equalizer.new(:subject)

    # Return presented object
    #
    # @return [Object]
    #
    # @api private
    #
    attr_reader :subject

    # Define accessors
    #
    # @param [Hash]
    #
    # @api private
    #
    def self.accessor(name, options)
    end

    private


    # Initialize object
    #
    # @param [Object] subject
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize(subject)
      @subject = subject
    end
  end
end
