require 'open-uri'
require 'nokogiri'
require 'nori'

module Big3
  class League
    attr_accessor :games, :game_ids, :game_stats, :player_name, :player_stats, :team_name, :p_s, :t_s

    def initialize(args={})
      @player_name = args[:player_name] ||= nil
      @team_name = args[:team_name] ||= nil
      retrieve_game_data
    end

    def team_stats
      @t_s = Hash.new { |h, k| h[k] = [] }
      @t_s["season"] = Hash.new { |h, k| h[k] = 0 }
      game_stats.each.with_index(1) do |teams, game_count|
        scores = {}
        if team_name.nil?
          add_scoring(scores, teams.away_team, teams.home_team)
          add_stats(scores, teams.away_team, teams.home_team, t_s, teams.location, game_count)
        else
          filter_team_stats(scores, teams.away_team, teams.home_team, t_s, teams.away_team, teams.location, game_count)
        end
      end
      unless team_name.nil?
        find_season_averages(t_s)
      else
        @t_s.delete("season")
      end
      @t_s
    end

    def player_stats
      unless player_name.nil?
        @p_s = Hash.new { |hash, key| hash[key] = [] }
        @p_s["season"] = Hash.new { |hash, key| hash[key] = 0 }
        game_stats.each do |teams|
          parse_game_stats(teams.away_team_players, p_s, teams.location)
          parse_game_stats(teams.home_team_players, p_s, teams.location)
        end
        find_season_averages(p_s)
        @p_s
      else
        raise NameError, "player_name is not defined"
      end
    end

    def parse_game_stats(players,
                         stats,
                         location)
      players.each do |player|
        if names_match?(player, player_name)
          stats["games"] << { "stats" => player["stats"],
                              "location" => location,
                              "game_number" => "#{stats["games"].length + 1}" }
          player["stats"].each do |k, v|
            v = v.to_f
            stats["season"][k] += v
          end
        else
          next
        end
      end
    end

    def add_scoring(scores,
                    away_team,
                    home_team)
      scores["first half"] = { "home" => home_team['linescore']["lineprd"][0]["@score"],
                               "away" => away_team['linescore']["lineprd"][0]["@score"] }
      scores["second half"] = { "home" => home_team['linescore']["lineprd"][1]["@score"],
                                "away" => away_team['linescore']["lineprd"][1]["@score"] }
      scores["final"] = { "home" => home_team['linescore']["@score"],
                          "away" => away_team['linescore']["@score"] }
    end

    def add_stats_to_season(stats,
                            team)
      team["totals"]["stats"].each do |k, v|
        v = v.to_f
        stats["season"][k] += v
      end
    end

    def find_season_averages(stats)
      stats["season"].each do |k, v|
        average = v / stats["games"].length
        stats["season"][k] = average.round(2).to_s
      end
    end

    def add_game(scores,
                 away_team,
                 home_team,
                 stats,
                 season_team,
                 location,
                 game_count)
      add_scoring(scores, away_team, home_team)
      add_stats(scores, away_team, home_team, stats, location, game_count)
      add_stats_to_season(stats, season_team)
    end

    def names_match?(item,
                     passed_item)
      item["@name"].gsub(/[^A-Za-z]/, "").downcase == passed_item.gsub(/[^A-Za-z]/, "").downcase
    end

    def add_stats(scores,
                  away_team,
                  home_team,
                  stats,
                  location,
                  game_count)
      from_both_teams = { "home" => home_team["totals"]["stats"],
                          "away" => away_team["totals"]["stats"] }
      stats["games"] << { "matchup" => "#{home_team["@name"]} vs #{away_team["@name"]}",
                          "home team" => home_team["@name"],
                          "away team" => away_team["@name"],
                          "scores" => scores,
                          "stats" => from_both_teams,
                          "location" => location,
                          "game_number" => game_count.to_s }
    end

    def filter_team_stats(scores,
                          away_team,
                          home_team,
                          stats,
                          season_team,
                          location,
                          game_count)
      stats["name"] = team_name.split.map(&:capitalize).join(' ')
      if names_match?(away_team, team_name)
        add_game(scores, away_team, home_team, stats, season_team, location, game_count)
      elsif names_match?(home_team, team_name)
        add_game(scores, away_team, home_team, stats, season_team, location, game_count)
      end
    end

    def games
    	events_page = Nokogiri::HTML(open("http://statbroadcast.com/events/archive.php?gid=bigthr"))
    	@games = events_page.css(".bcs_newsarticle_link")
    	@games
    end

    def game_ids
    	@game_ids = games.map { |entry| entry['href'].to_s.gsub("archived.php?id=", "")}
      @game_ids.pop
      @game_ids
    end

    def retrieve_game_data
      @game_stats = GameManager.new({ids: game_ids}).create_games
      @game_stats
    end

    def teams
      @teams = ["Tri State", "Killer 3s", "Ball Hogs", "3 Headed Monsters", "Trilogy", "Power", "Ghost Ballers", "3's Company"]
      @teams
    end

    def rosters
      @rosters ||= find_rosters
    end

    def find_rosters
      @rosters = Hash.new { |h, k| h[k] = [] }
      game_stats.each do |team|
        add_players(team.away_team_players, team.away_team_name, rosters)
        add_players(team.home_team_players, team.home_team_name, rosters)
      end
      @rosters
    end

    def add_players(players,
                    team_name,
                    league)
      players.each do |player|
        team_name = team_name.sub("3s","3's")
        player_name = player['@name']
        player_name = player_name.sub("Mahmoud-","Mahmoud ")
        if teams.include?(player_name) || player_name.include?("TEAM") || league[team_name].include?(player_name)
          next
        else
          league[team_name] << player_name
        end
      end
    end    
  end
end
