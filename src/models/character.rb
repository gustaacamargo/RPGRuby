class Character
  # Todos os personagens tem nome, idade, vida, ataque, defesa, inteligência, força, e uma Raça (Humano, Elfo, Orc, Anão - usar herança).
  attr_accessor :name
  attr_accessor :age

  def initialize(name, age, race)
    @life = race.life
    @attack = race.attack
    @defense = race.defense
    @intelligence = race.intelligence
    @force = race.force
    @race = race
    @name = name
    @age = age
  end

  def calculate
  end
end
