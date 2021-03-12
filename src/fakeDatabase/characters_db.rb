require_relative '../models/character'

class CharactersDb
  def initialize
    @characters = []
  end

  def add(character)
    @characters << character
  end

  def select_one(id)
    @characters[id] unless @characters[id].instance_of(NilClass)
  end

  def return_all
    @characters
  end
end
