require_relative 'race'
class Elf < Race
  attr_accessor :name

  def initialize
    super(25, 5, 6, 20, 10)
    @name = 'Elfo'
  end
end
