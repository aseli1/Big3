require "test_helper"

class Big3Test < Minitest::Test
  def setup
    @stats = Big3::League.new
  end

  def test_team_stats
    assert true, @stats.team_stats
  end

  def test_player_name_nil?
    assert_raise NameError do
      puts @stats.player_stats
    end
  end

  def test_that_it_has_a_version_number
    refute_nil ::Big3::VERSION
  end

end
