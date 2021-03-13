require_relative '../fakeDatabase/characters_db'
require_relative '../models/character'

class CharacterController
  def initialize
    @db = CharactersDb.new
  end

  def store(name, age, race)
    character = Character.new(name, age, race)
    @db.add(character)

    'Personagem cadastrado com sucesso'
  end

  def return_all_characters
    characters = @db.return_all

    characters.each do |character|
      yield(character) if block_given?
    end
  end
end
