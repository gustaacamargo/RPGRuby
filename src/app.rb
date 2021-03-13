require 'faker'
require_relative './controllers/character_controller'
require_relative './controllers/character_class_controller'
require_relative './models/dwarf'
require_relative './models/elf'
require_relative './models/human'
require_relative './models/orc'

character_controller = CharacterController.new
character_class_controller = CharacterClassController.new

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

def define_skills
  end_loop = 0
  skills = []
  while end_loop.zero?
    system('clear')
    puts 'Descreva a habilidade:'
    print '> '
    skills << gets.strip.to_s

    exit_loop = 0
    while exit_loop.zero?
      puts("\nDeseja adicionar mais uma habilidade? (1 pra sim/0 pra não)")
      print '> '
      response = gets.strip.to_i
      exit_loop = 1 unless response.negative? || response > 1
      end_loop = 1 unless response != 0
    end
  end

  skills
end

def define_attributes
  system('clear')
  attributes = {
    life: 0,
    attack: 0,
    defense: 0,
    intelligence: 0,
    force: 0
  }

  puts 'Valor da vida para essa classe: (Se não for alterar, digite 0)'
  print '> '
  life = gets.strip.to_i
  attributes[:life] = life unless life.zero?

  puts 'Valor do ataque para essa classe: (Se não for alterar, digite 0)'
  print '> '
  attack = gets.strip.to_i
  attributes[:attack] = attack unless attack.zero?

  puts 'Valor da defesa para essa classe: (Se não for alterar, digite 0)'
  print '> '
  defense = gets.strip.to_i
  attributes[:defense] = defense unless defense.zero?

  puts 'Valor da inteligência para essa classe: (Se não for alterar, digite 0)'
  print '> '
  intelligence = gets.strip.to_i
  attributes[:intelligence] = intelligence unless intelligence.zero?

  puts 'Valor da força para essa classe: (Se não for alterar, digite 0)'
  print '> '
  force = gets.strip.to_i
  attributes[:force] = force unless force.zero?

  attributes
end

# tudo que está acima passar para outra pasta e arquivos

while option != 7
  system('clear')
  puts "============ ◈ RPGRuby ◈ ============\n\n"
  puts "O que deseja fazer?\n\n"
  puts '1 - Cadastrar personagem'
  puts '2 - Cadastrar classe de personagem'
  puts '3 - Treinar personagem'
  puts '4 - Calcular atributos do personagem'
  puts '5 - Listar persongens por raça'
  puts '6 - Listar personagens por classe'
  puts '7 - Sair'
  print "\n> "

  option = gets.strip.to_i

  if option >= 1 && option <= 7
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
      system('clear')
      puts 'Digite o nome para essa classe:'
      print '> '
      name = gets.strip.to_s
      skills = define_skills
      attributes = define_attributes

      response = character_class_controller.store(name, skills, attributes)
      puts response
      clear_with_message
    when 3
      puts 'op3'
    when 4
      puts 'op4'
    when 5
      system('clear')
      puts "\n\nLista de personagens\n"
      puts character_controller.return_all_characters
      clear_with_message
    when 6
      system('clear')
      puts "\n\nLista de classes\n"
      puts character_class_controller.return_all_characters_classes
      clear_with_message
    else
      puts 'Você escolheu sair...'
      clear_with_message
    end
  else
    puts 'Opção inválida, selecione outra!'
    clear_with_message
  end
end
