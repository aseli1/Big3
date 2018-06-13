# Big3

Big3 Basketball Stats

* Team
* Player
* Season
* Scores
* Rosters

## Installation

    $ gem install big_3

## Usage

```ruby
require 'big_3'

big_3 = Big3::League.new
all_games = big_3.team_stats["games"]
all_games[1]
# => => {"matchup"=>"Trilogy vs 3 Headed Monsters", "home team"=>"Trilogy", "away team"=>"3 Headed Monsters", "scores"=>{"first half"=>{"home"=>"25", "away"=>"9"}, "second half"=>{"home"=>"25", "away"=>"28"}, "final"=>{"home"=>"50", "away"=>"37"}}...
```

Filter by team

```ruby
big_3.team_name = "Ball Hogs"
```

Player stats

```ruby
big_3.player_name = "Moochie Norris"
big_3.player_stats["season"] # season averages
# => {"@min"=>"5.67", "@fga"=>"1.67", "@fgm"=>"0.33", "@fga3"=>"1.33", "@fgm3"=>"0.33", "@fga4"=>"0.0", "@fgm4"=>"0.0", "@fta2"=>"0.67", "@ftm2"=>"0.0", "@fta3"=>"0.0", "@ftm3"=>"0.0", "@fta4"=>"0.0", "@ftm4"=>"0.0", "@fta1"=>"0.0", "@ftm1"=>"0.0", "@fta"=>"0.67", "@ftm"=>"0.0", "@treb"=>"1.33", "@oreb"=>"0.33", "@dreb"=>"1.0", "@ast"=>"0.67", "@stl"=>"0.67", "@blk"=>"0.0", "@pf"=>"1.0", "@tp"=>"1.0", "@eff"=>"1.67", "@net"=>"23.87", "@plusminus"=>"-3.33", "@to"=>"0.67"}
```

Optional parameters

```ruby
Big3::League.new(team_name: "Trilogy", player_name: "Mike Bibby")
```

Teams and players

```ruby
big_3.rosters
# => {"3 Headed Monsters"=>["Rashard Lewis", "Kwame Brown", "Eddie Basden", "Hakim Warrick", "Mahmoud Abdul-Rauf", "Jason Williams", "Kareem Rush"], .etc}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aseli1/big_3.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
