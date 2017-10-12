module Big3
  class GameManager
    attr_accessor :ids

    def initialize(args={})
      @ids = args[:ids]
    end

    def create_games
      unordered_games = ids.map { |id| Game.new(id) } 
      games = unordered_games.sort! { |a, b| a.date <=> b.date }
      games
    end
  end
end