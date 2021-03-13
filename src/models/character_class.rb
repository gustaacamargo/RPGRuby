class CharacterClass
  # Todos os personagens tem nome, idade, vida, ataque, defesa, inteligência, força, e uma Raça (Humano, Elfo, Orc, Anão - usar herança).
  attr_accessor :name, :skills, :age, :life, :attack, :defense, :intelligence, :force

  def initialize(name, skills, attributes)
    @name = name
    @skills = skills
    @life = attributes[:life] unless attributes[:life].nil?
    @attack = attributes[:attack] unless attributes[:attack].nil?
    @defense = attributes[:defense] unless attributes[:defense].nil?
    @intelligence = attributes[:intelligence] unless attributes[:intelligence].nil?
    @force = attributes[:force] unless attributes[:force].nil?
  end
end
