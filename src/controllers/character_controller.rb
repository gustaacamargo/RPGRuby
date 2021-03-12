require_relative '../fakeDatabase/characters_db'
require_relative '../models/character'

class CharacterController
  def initialize
    @db = CharactersDb.new
  end

  def store(name, age, race)
    if race.instance_of?(Race)
      character = Character.new(name, age, race)
      @db.add(character)
    else
      puts 'Erro ao cadastrar personagem, verifique se tudo está correto'
    end
  end

  def return_all_characters
    @db.return_all
  end
end
