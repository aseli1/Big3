require "test_helper"

class Big3Test < Minitest::Test
  def setup
    @stats = Big3::League.new
  end

  def test_team_stats
    assert_instance_of Hash, @stats.team_stats
  end

  def test_player_name_nil?
    exception = assert_raises NameError do
      @stats.player_stats
    end
    assert_equal("player_name is not defined", exception.message)
  end

  def test_player_stats
    @stats.player_name = "Mike Bibby"
    assert_instance_of Hash, @stats.player_stats
  end

  def test_rosters
    assert_instance_of Hash, @stats.rosters
  end

  def test_that_it_has_a_version_number
    refute_nil ::Big3::VERSION
  end
end
