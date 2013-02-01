module Status
  class Presenter
    include Adamantium::Flat, Composition.new(:subject)

    class Travis
    end

    class Github
    end
  end
end
