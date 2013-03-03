module Status
  # A dm team meber
  class Member
    include Anima.new(:name, :nick, :twitter_username, :github_username, :url)
  end
end
