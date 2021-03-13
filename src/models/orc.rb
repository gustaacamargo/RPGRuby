require_relative 'race'
class Orc < Race
  attr_accessor :name

  def initialize
    super(15, 12, 5, 2, 25)
    @name = 'Orc'
  end
end
