require_relative '../fakeDatabase/characters_class_db'
require_relative '../models/character_class'

class CharacterClassController
  def initialize
    @db = CharactersClassDb.new
    # store('Construtor', ['Construir casas'], { force: 1, intelligence: 1, life: -2 })
    # store('Ferreiro', ['Construir espadas', 'Construir armaduras'], { force: 2, attack: 1 })
    # store('Curandeiro', ['Curar outras unidades'], { defense: 3, attack: -1, intelligence: 3 })
    # store('Guerreiro', %w[Atacar Defender], { force: 2, attack: 3, defense: 2 })
  end

  def store(name, skills, attributes)
    verify = select_by_name(name)
    if verify.nil?
      character_class = CharacterClass.new(name, skills, attributes)
      @db.add(character_class)
      'Classe cadastrada com sucesso'
    else
      'Nome de classe já existente!'
    end
  end

  def select_by_name(name)
    @db.select_one('name', name)
  end

  def return_all_characters_classes
    @db.return_all
  end
end
