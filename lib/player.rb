class Player
  attr_reader :name, :hit_points

  MAX_HP = 100
  AP = 10

  def initialize(name)
    @name = name
    @hit_points = MAX_HP
  end

  

end
