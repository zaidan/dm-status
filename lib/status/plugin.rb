module Status
  # Abstract base class for plugins
  class Plugin
    extend DescendantsTracker
    include Adamantium::Flat, AbstractType, Concord.new(:project_name, :project_short_name)
    
    # Return url
    #
    # @return [String]
    #
    # @api private
    #
    abstract_method :url

    # Return image source
    #
    # @return [String]
    #
    # @api private
    #
    abstract_method :image_src
    

    # Return plugin titles
    #
    # @return [Enumerable<String>]
    #
    # @api private
    #
    def self.titles
      descendants.map { |plugin| class_name(plugin) }
    end

  private

    # Return class name
    #
    # @return [String]
    #
    # @api private
    #
    def self.class_name(klass)
      klass.name.split('::').last 
    end
    private_class_method :class_name
  end
end
