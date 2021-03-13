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

    characters.map do |character|
      puts "\n\n===== #{character.name} ===== \n\n"
      puts "Idade: #{character.age}"
      puts "Ataque: #{character.attack}"
      puts "Defesa: #{character.defense}"
      puts "Força: #{character.force}"
      puts "Inteligência: #{character.intelligence}"
      puts "Vida: #{character.life}"
      puts "Raça: #{character.race.name}\n"
    end
  end
end
