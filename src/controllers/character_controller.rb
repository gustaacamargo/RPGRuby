require_relative '../fakeDatabase/characters_db'
require_relative '../models/character'
require_relative '../modules/returner'
class CharacterController
  include Returner

  def initialize
    @db = CharactersDb.new
  end

  def store(name, age, race, character_class)
    character = Character.new(name, age, race, [character_class])
    @db.add(character)

    'Personagem cadastrado com sucesso'
  end

  def return_characters_by_something(something, key, &block)
    characters = @db.return_all
    return_by_name_of_something(characters, something, key, &block)
  end

  def return_all_characters
    @db.return_all
  end
end
