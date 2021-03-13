require_relative '../controllers/character_controller'
require_relative '../models/dwarf'
require_relative '../models/elf'
require_relative '../models/human'
require_relative '../models/orc'

class CharactersView
  def initialize
    @character_controller = CharacterController.new
  end

  def insert_character
    race_option = select_race('Escolha a raça do seu personagem')
    race = return_race_selected(race_option)

    option_name = choose_option_for_name
    name = define_name(option_name)

    system('clear')
    puts 'Agora digite a idade do seu personagem'
    print '> '
    age = gets.strip.to_i

    response = @character_controller.store(name, age, race)
    puts response
  end

  def list_characters
    puts "\n\nLista de personagens\n"
    puts @character_controller.return_all_characters
  end

  def select_race_to_show
    race = ''
    race_option = select_race('Deseja listar personagens de qual raça?')
    case race_option
    when 1
      race = 'Humano'
    when 2
      race = 'Elfo'
    when 3
      race = 'Anão'
    when 4
      race = 'Orc'
    end
    race
  end

  def select_by_race
    race_selected = select_race_to_show
    system('clear')
    @character_controller.return_all_characters do |character|
      show = false
      show = true if character.race.name == race_selected

      if show
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

  private
  def select_race(title)
    race_option = 0

    while race_option < 1 || race_option > 4
      system('clear')
      puts "#{title}\n\n"
      puts '1 - Humano'
      puts '2 - Elfo'
      puts '3 - Anão'
      puts '4 - Orc'
      print "\n> "
      race_option = gets.strip.to_i
    end

    race_option
  end

  def return_race_selected(number)
    case number
    when 1
      Human.new
    when 2
      Elf.new
    when 3
      Dwarf.new
    when 4
      Orc.new
    else
      puts 'Opção para gerar raça inválida'
    end
  end

  def choose_option_for_name
    option_name = 0
    while option_name < 1 || option_name > 2
      option_name = 0
      system('clear')
      puts '1 - Deseja informar um nome'
      puts "2 - Deseja gerar um nome aleatório\n"
      print '> '
      option_name = gets.strip.to_i

      if option_name < 1 || option_name > 2
        puts 'Opção inválida!'
        clear_with_message
      end
    end

    option_name
  end

  def define_name(option_name)
    system('clear')
    case option_name
    when 1
      puts 'Digite o nome do seu personagem'
      print '> '
      name = gets.strip.to_s
    when 2
      name = Faker::Name.name
    end

    name
  end
end
