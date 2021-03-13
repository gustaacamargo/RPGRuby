require_relative 'race'
class Human < Race
  attr_accessor :name

  def initialize
    super(20, 8, 8, 10, 10)
    @name = 'Humano'
  end
end
