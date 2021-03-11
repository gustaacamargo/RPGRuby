class Character
  # Todos os personagens tem nome, idade, vida, ataque, defesa, inteligência, força, e uma Raça (Humano, Elfo, Orc, Anão - usar herança).
  attr_accessor :name
  attr_accessor :age

  def initialize(life, attack, defense, intelligence, force)
    @life = life
    @attack = attack
    @defense = defense
    @intelligence = intelligence
    @force = force
  end
end
