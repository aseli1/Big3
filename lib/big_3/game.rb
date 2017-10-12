module Big3
  class Game
    attr_accessor :id, :url, :information, :stats, :home_team, :home_team_name, :home_team_players, :away_team, :away_team_name, :away_team_players

    def initialize(id)
      @id = id
    end

    def url
      @url = "http://archive.statbroadcast.com/#{id}.xml"
      @url
    end

    def information
      @information = Nokogiri::XML(open(url)).to_s
      @information
    end

    def stats
      parser = Nori.new
      parser = parser.parse(information)['bbgame']
      @stats = parser
    end

    def home_team
      @home_team = stats["team"][1]
    end

    def home_team_name
      @home_team_name = stats["team"][1]["@name"]
    end

    def home_team_players
      @home_team_players = stats["team"][1]["player"]
    end

    def away_team
      @away_team = stats["team"][0]
    end
    
    def away_team_players
      @away_team_players = stats["team"][0]["player"]
    end
    
    def away_team_name
      @away_team_name = stats["team"][0]["@name"]
    end

    def venue
      @venue = stats['venue']
      @venue
    end

    def location
      @location = stats["venue"]["@location"]
      @location
    end

    def date
      @date = stats["venue"]["@date"]
      @date
    end
  end
end