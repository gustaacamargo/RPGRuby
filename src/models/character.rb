class Character
  # Todos os personagens tem nome, idade, vida, ataque, defesa, inteligência, força, e uma Raça (Humano, Elfo, Orc, Anão - usar herança).
  attr_accessor :name, :age, :life, :attack, :defense, :intelligence, :force, :race, :classes

  def initialize(name, age, race, classes)
    @life = race.life
    @attack = race.attack
    @defense = race.defense
    @intelligence = race.intelligence
    @force = race.force
    @race = race
    @name = name
    @age = age
    @classes = classes
  end

  def calculate
  end

  def add_class(character_class)
    @classes << character_class
  end
end
