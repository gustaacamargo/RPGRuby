require_relative '../controllers/character_class_controller'

class CharactersClassView
  def initialize(character_class_controller)
    @character_class_controller = character_class_controller
  end

  def insert_character_class
    puts 'Digite o nome para essa classe:'
    print '> '
    name = gets.strip.to_s
    skills = define_skills
    attributes = define_attributes

    response = @character_class_controller.store(name, skills, attributes)
    puts response
  end

  def list_classes
    puts "\n\nLista de classes\n"
    puts @character_class_controller.return_all_characters_classes
  end

  private
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
end
