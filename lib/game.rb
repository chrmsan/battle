require_relative 'player'

class Game

  attr_reader :player, :player_1, :player_2, :name, :current_player

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @current_player = @player_1
    @players = [@player_1, @player_2]
  end

  def attack(player)
    player.receive_damage
  end

  def enemy_player
    @players.detect {|player| player != @current_player}
  end

  def switch_turn
    @current_player = enemy_player
  end
end
