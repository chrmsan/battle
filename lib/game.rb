require_relative 'player'

class Game

  attr_reader :player

  def attack(player)
    player.receive_damage
  end

end
