class Team

  attr_reader :team_name, :players, :points
  attr_accessor :coach

  def initialize(team_name, players, coach_name)
    @team_name = team_name
    @players = players
    @coach = coach_name
    @points = 0
  end

  def add_player(new_player)
    # This broken code will pass test_new_player_can_be_added
    # @players = [nil, nil, nil, nil, nil]
    # This broken code will pass the previous test and also test_add_two_players
    # @players << nil
    # This broken code will pass the previous tests and also test_can_add_the_given_player
    # @players << "Jeff"
    # After adding test_can_add_the_given_player__two_different_players
    # Our tests are now sufficient to force us to write more sensible code:
    @players << new_player
  end

  def has_player?(player)
    return @players.include?(player)
  end

  def play_game(game_won)
    if game_won
      @points += 3
    end
  end

end
