class Player
  attr_reader :name, :health


  def initialize(name)
    @name = name
    @health = 100
  end

  def takes_damage(damage)
    @health -= damage
  end

end
