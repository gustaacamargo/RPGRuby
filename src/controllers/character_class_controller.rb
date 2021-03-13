require_relative '../fakeDatabase/characters_class_db'
require_relative '../models/character_class'

class CharacterClassController
  def initialize
    @db = CharactersClassDb.new
    store('Construtor', ['Construir casas'], { force: 1, intelligence: 1, life: -2 })
    store('Ferreiro', ['Construir espadas', 'Construir armaduras'], { force: 2, attack: 1 })
    store('Curandeiro', ['Curar outras unidades'], { defense: 3, attack: -1, intelligence: 3 })
    store('Guerreiro', %w[Atacar Defender], { force: 2, attack: 3, defense: 2 })
  end

  def store(name, skills, attributes)
    character_class = CharacterClass.new(name, skills, attributes)
    @db.add(character_class)

    'Classe cadastrada com sucesso'
  end

  def return_all_characters_classes
    characters_classes = @db.return_all

    characters_classes.map do |character_class|
      puts "\n\n===== #{character_class.name} ===== \n\n"
      puts "Habilidades: #{character_class.skills}"
      puts "Ataque: #{character_class.attack}" unless character_class.attack.nil?
      puts "Defesa: #{character_class.defense}" unless character_class.defense.nil?
      puts "Força: #{character_class.force}" unless character_class.force.nil?
      puts "Inteligência: #{character_class.intelligence}" unless character_class.intelligence.nil?
      puts "Vida: #{character_class.life}" unless character_class.life.nil?
    end
  end
end
