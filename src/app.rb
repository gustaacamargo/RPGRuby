require 'faker'
require_relative './views/characters_view'
require_relative './views/characters_class_view'

character_view = CharactersView.new
character_class_view = CharactersClassView.new

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
      clear_with_message
    when 2
      character_class_view.insert_character_class
      clear_with_message
    when 3
      puts 'op3'
    when 4
      puts 'op4'
    when 5
      character_view.list_characters
      clear_with_message
    when 6
      character_class_view.list_classes
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
