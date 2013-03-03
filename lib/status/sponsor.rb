module Status
  class Sponsor
    include Anima.new(:name, :url, :logo, :markdown)
  end
end
