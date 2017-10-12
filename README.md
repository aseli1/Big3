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

Viewing all games

```ruby
big_3 = Big3::League.new
big_3.team_stats
# => Returns a hash containing team stats and scores from all games
```

Filtering games by team name

```ruby
big_3.team_name = "Ball Hogs" # season averages will also be included
```

Viewing individual player stats

```ruby
big_3.player_name = "Moochie Norris"
big_3.player_stats
# => Returns a hash containing player stats from all games played
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

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/big_3.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
