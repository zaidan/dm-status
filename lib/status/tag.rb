module Status
  # A project tag
  class Tag
    include Adamantium::Flat, Concord.new(:name)
  end
end
