module Status
  class Request
    include Composition.new(:url, :presenter)

    def self.run(*args)
      instance = new(*args).presenter
    end
  end
end
