# Big3

Big3 adds stats from all games played in the Big3 basketball league.  This includes:

* Team stats
* Player stats
* Season averages
* Scores
* Rosters


## Installation

    $ gem install big_3

## Usage

```ruby
big_3 = Big3::League.new
all_games = big_3.team_stats["games"]
# => Returns a hash containing team stats and scores from all games

all_games[32]
=begin
# => {"matchup"=>"Trilogy vs 3 Headed Monsters",
	  "home team"=>"Trilogy",
	  "away team"=>"3 Headed Monsters",
	  "scores"=>
	   {"first half"=>{"home"=>"25", "away"=>"24"},
	    "second half"=>{"home"=>"26", "away"=>"22"},
	    "final"=>{"home"=>"51", "away"=>"46"}},
	  "stats"=>
	   {"home"=>
	     {"@ftpct"=>"136.4",
	      "@fg3pct"=>"42.9",
	      "@fgpct"=>"45.5",
	      "@fga4"=>"0",
	      "@fgm4"=>"0",
	      "@fg4pct"=>"",
	      "@ft1pct"=>"",
	      "@ft2pct"=>"60.0",
	      "@ft3pct"=>"100.0",
	      "@ft4pct"=>"",
	      "@fta1"=>"0",
	      "@ftm1"=>"0",
	      "@fta2"=>"10",
	      "@ftm2"=>"6",
	      "@fta3"=>"1",
	      "@ftm3"=>"1",
	      "@fta4"=>"0",
	      "@ftm4"=>"0",
	      "@deadballs"=>"",
	      "@tp"=>"51",
	      "@to"=>"5",
	      "@pf"=>"10",
	      "@dreb"=>"10",
	      "@oreb"=>"5",
	      "@treb"=>"15",
	      "@min"=>"87.7",
	      "@ast"=>"5",
	      "@stl"=>"3",
	      "@blk"=>"1",
	      "@fta"=>"11",
	      "@ftm"=>"15",
	      "@fga"=>" 33",
	      "@fgm"=>" 15",
	      "@fga3"=>"14",
	      "@fgm3"=>"6"},
	    "away"=>
	     {"@ftpct"=>"100.0",
	      "@fg3pct"=>"25.0",
	      "@fgpct"=>"56.8",
	      "@fga4"=>"0",
	      "@fgm4"=>"0",
	      "@fg4pct"=>"",
	      "@ft1pct"=>"",
	      "@ft2pct"=>"50.0",
	      "@ft3pct"=>"",
	      "@ft4pct"=>"",
	      "@fta1"=>"0",
	      "@ftm1"=>"0",
	      "@fta2"=>"2",
	      "@ftm2"=>"1",
	      "@fta3"=>"0",
	      "@ftm3"=>"0",
	      "@fta4"=>"0",
	      "@ftm4"=>"0",
	      "@deadballs"=>"",
	      "@tp"=>"46",
	      "@to"=>"4",
	      "@pf"=>"14",
	      "@dreb"=>"17",
	      "@oreb"=>"7",
	      "@treb"=>"24",
	      "@min"=>"27.4",
	      "@ast"=>"10",
	      "@stl"=>"2",
	      "@blk"=>"4",
	      "@fta"=>"2",
	      "@ftm"=>"2",
	      "@fga"=>" 37",
	      "@fgm"=>" 21",
	      "@fga3"=>"8",
	      "@fgm3"=>"2"}},
	  "location"=>"MGM Grand Garden Arena, Las Vegas",
	  "game_number"=>"33"}
=end
```

Filtering games by team name

```ruby
big_3.team_name = "Ball Hogs"
```

Viewing individual player stats

```ruby
big_3.player_name = "Moochie Norris"
big_3.player_stats["season"] # season averages
=begin
# => {"@min"=>"5.67",
	  "@fga"=>"1.67",
	  "@fgm"=>"0.33",
	  "@fga3"=>"1.33",
	  "@fgm3"=>"0.33",
	  "@fga4"=>"0.0",
	  "@fgm4"=>"0.0",
	  "@fta2"=>"0.67",
	  "@ftm2"=>"0.0",
	  "@fta3"=>"0.0",
	  "@ftm3"=>"0.0",
	  "@fta4"=>"0.0",
	  "@ftm4"=>"0.0",
	  "@fta1"=>"0.0",
	  "@ftm1"=>"0.0",
	  "@fta"=>"0.67",
	  "@ftm"=>"0.0",
	  "@treb"=>"1.33",
	  "@oreb"=>"0.33",
	  "@dreb"=>"1.0",
	  "@ast"=>"0.67",
	  "@stl"=>"0.67",
	  "@blk"=>"0.0",
	  "@pf"=>"1.0",
	  "@tp"=>"1.0",
	  "@eff"=>"1.67",
	  "@net"=>"23.87",
	  "@plusminus"=>"-3.33",
	  "@to"=>"0.67"}
=end
```

Optional parameters

```ruby
Big3::League.new(team_name: "Trilogy", player_name: "Mike Bibby")
```

Finding teams and players

```ruby
big_3.rosters
# => {"3 Headed Monsters"=>["Rashard Lewis", "Kwame Brown", "Eddie Basden", "Hakim Warrick", "Mahmoud Abdul-Rauf", "Jason Williams", "Kareem Rush"], .etc}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aseli1/big_3.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
