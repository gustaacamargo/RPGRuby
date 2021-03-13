require_relative 'race'
class Dwarf < Race
  attr_accessor :name

  def initialize
    super(18, 9, 11, 7, 20)
    @name = 'Anão'
  end
end
