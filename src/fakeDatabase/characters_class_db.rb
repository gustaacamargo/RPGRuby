class CharactersClassDb
  def initialize
    @characters_classes = []
  end

  def add(character_class)
    @characters_classes << character_class
  end

  def select_one(key, value)
    value_to_return = nil
    @characters_classes.each do |character|
      case key
      when 'name'
        value_to_return = character if character.name == value
      end
    end
    value_to_return
  end

  def return_all
    @characters_classes
  end
end
