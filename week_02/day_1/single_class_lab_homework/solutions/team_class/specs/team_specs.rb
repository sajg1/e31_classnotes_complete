require('minitest/autorun')
require('minitest/rg')
require_relative('../team')

class TeamTest < MiniTest::Test

  def setup()
    players = ["Derice Bannock", "Sanka Coffie", "Junior Bevil", "Yul Brenner"]
    @team = Team.new("Cool Runnings", players, "Irv Blitzer")
  end

  def test_team_has_name()
    assert_equal("Cool Runnings", @team.team_name())
  end

  def test_team_has_players()
    assert_equal(4, @team.players().count())
  end

  def test_team_has_coach()
    assert_equal("Irv Blitzer", @team.coach())
  end

  def test_check_team_has_points()
    assert_equal(0, @team.points())
  end

  def test_coach_can_be_updated()
    @team.coach = "John Candy"
    assert_equal("John Candy", @team.coach())
  end

  def test_new_player_can_be_added()
    new_player = "Jeff"
    @team.add_player(new_player)
    assert_equal(5, @team.players().count())
  end

  def test_check_player_in_team__found()
    assert_equal(true, @team.has_player?("Junior Bevil"))
  end

  def test_check_player_in_team__not_found()
    assert_equal(false, @team.has_player?("Usain Bolt"))
  end

  def test_play_game__win()
    @team.play_game(true)
    assert_equal(3, @team.points())
  end

  def test_play_game__lose()
    @team.play_game(false)
    assert_equal(0, @team.points())
  end

  # Extra from HW review

  def test_cannot_set_players_array()
    # This line will throw an error. This is good. We do not have a setter
    # method on the 'players' property of Team. And we do not want one.

    # @team.players = []

    # However, in the next test, test_can_modify_players_with_only_getter, we
    # will see how we CAN modify the array without a setter, it only stops us
    # from replacing the array entirely. It doesn't prevent us from modifying
    # the array which the getter returns to us
  end

  def test_can_modify_players_with_only_getter
    initial_players = ["Derice Bannock", "Sanka Coffie", "Junior Bevil", "Yul Brenner"]
    assert_equal(initial_players, @team.players)

    @team.players.delete("Derice Bannock")
    @team.players.clear()

    assert_equal([], @team.players)

    @team.players.push("Craig")
    @team.players.push("Louise")
    @team.players.push("Sandy")

    assert_equal(["Craig", "Louise", "Sandy"], @team.players)
    # To prevent this from being possible, you would write a custom getter, not
    # using attr_reader, which returned a copy of the source array @players,
    # but did not directly return the @players array to the outside world
  end

  def test_add_two_players
    @team.add_player('Bill')
    @team.add_player('Ben')
    assert_equal(6, @team.players().count())
  end

  def test_can_add_the_given_player
    new_player = "Jeff"
    @team.add_player(new_player)
    expected = ["Derice Bannock", "Sanka Coffie", "Junior Bevil", "Yul Brenner", "Jeff"]
    assert_equal(expected, @team.players())
  end

  def test_can_add_the_given_player__two_different_players
    @team.add_player('Bill')
    @team.add_player('Ben')
    expected = ["Derice Bannock", "Sanka Coffie", "Junior Bevil", "Yul Brenner", "Bill", "Ben"]
    assert_equal(expected, @team.players())
  end

end
