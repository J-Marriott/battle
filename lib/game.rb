class Game
  attr_reader :player_1, :player_2, :active_player

  def initialize player_1, player_2
    @player_1 = player_1
    @player_2 = player_2
    @active_player = player_1
    @@game = self
  end

  def self.instance
    @@game
  end

  def attack player
    player.takes_damage
  end

  def switch
    @active_player = opponent_of
  end

  def opponent_of
    if @active_player == player_1
      player_2
    else
      player_1
    end
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def active_player
    @active_player
  end
  private

  def player_1_active
    @active_player == player_1
  end

  def player_2_active
    @active_player == player_2
  end

end
