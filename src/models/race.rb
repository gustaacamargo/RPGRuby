class Race
  attr_accessor :life, :attack, :defense, :intelligence, :force

  def initialize(life, attack, defense, intelligence, force)
    @life = life
    @attack = attack
    @defense = defense
    @intelligence = intelligence
    @force = force
  end
end
