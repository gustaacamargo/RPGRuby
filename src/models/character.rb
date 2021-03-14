class Character
  # Todos os personagens tem nome, idade, vida, ataque, defesa, inteligência, força, e uma Raça (Humano, Elfo, Orc, Anão - usar herança).
  attr_accessor :name, :age, :life, :attack, :defense, :intelligence, :force, :race, :classes, :skills

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
    @skills = []
    add_skills(classes)
  end

  def calculate_atk_def
    total_attack_from_classes = 0
    total_defense_from_classes = 0
    @classes.map do |character_class|
      total_attack_from_classes += character_class.attack unless character_class.attack.nil?
      total_defense_from_classes += character_class.defense unless character_class.defense.nil?
    end

    {
      attack: total_attack_from_classes + @attack,
      defense: total_defense_from_classes + @defense
    }
  end

  def add_class(character_class)
    @classes << character_class unless @classes.any? { |c_class| c_class.name == character_class.name }
  end

  def add_skills(classes)
    classes.each do |c_class|
      c_class.skills.each do |skill|
        @skills << skill unless @skills.any? { |sk| sk == skill }
      end
    end
  end
end
