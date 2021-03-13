require 'faker'
require_relative './controllers/character_controller'
require_relative './models/dwarf'
require_relative './models/elf'
require_relative './models/human'
require_relative './models/orc'

character_controller = CharacterController.new

system('clear')
option = 0

def clear_with_message
  puts 'Pressione qualquer tecla para continuar...'
  gets
  system('clear')
end

def select_race
  race_option = 0

  while race_option < 1 || race_option > 4
    system('clear')
    puts "Escolha a raça do seu personagem\n\n"
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

while option != 6
  puts "============ ◈ RPGRuby ◈ ============\n\n"
  puts "O que deseja fazer?\n\n"
  puts '1 - Cadastrar personagem'
  puts '2 - Treinar personagem'
  puts '3 - Calcular atributos do personagem'
  puts '4 - Listar persongens por raça'
  puts '5 - Listar personagens por classe'
  puts '6 - Sair'
  print "\n> "

  option = gets.strip.to_i

  if option >= 1 && option <= 6
    case option
    when 1
      option = 0
      race_option = select_race
      race = return_race_selected(race_option)

      option_name = choose_option_for_name
      name = define_name(option_name)

      system('clear')
      puts 'Agora digite a idade do seu personagem'
      print '> '
      age = gets.strip.to_i

      response = character_controller.store(name, age, race)
      puts response
      clear_with_message
    when 2
      puts 'op2'
    when 3
      puts 'op3'
    when 4
      system('clear')
      puts "\n\nLista de personagens\n"
      puts character_controller.return_all_characters
      clear_with_message
    when 5
      puts 'op5'
    else
      puts 'Você escolheu sair...'
      clear_with_message
    end
  else
    puts 'Opção inválida, selecione outra!'
    clear_with_message
  end
end
