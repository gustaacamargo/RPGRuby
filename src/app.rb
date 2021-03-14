require 'faker'
require_relative './views/characters_view'
require_relative './views/characters_class_view'
require_relative './controllers/character_class_controller'

character_class_controller = CharacterClassController.new
character_view = CharactersView.new(character_class_controller)
character_class_view = CharactersClassView.new(character_class_controller)

system('clear')
option = 0

def clear_with_message
  puts 'Pressione qualquer tecla para continuar...'
  gets
  system('clear')
end

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
    system('clear')
    case option
    when 1
      character_view.insert_character
    when 2
      character_class_view.insert_character_class
    when 3
      character_view.practice
    when 4
      character_view.calculate_atk_def
    when 5
      character_view.select_by_race
    when 6
      character_view.select_by_class
    else
      puts 'Você escolheu sair...'
    end
  else
    puts 'Opção inválida, selecione outra!'
  end
  clear_with_message
end
