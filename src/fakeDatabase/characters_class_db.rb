class CharactersClassDb
  def initialize
    @characters_classes = []
  end

  def add(character_class)
    @characters_classes << character_class
  end

  def select_one(id)
    @characters_classes[id] unless @characters_classes[id].instance_of(NilClass)
  end

  def return_all
    @characters_classes
  end
end
