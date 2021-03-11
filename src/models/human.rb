require_relative 'race'
# life, attack, defense, intelligence, force
class Human < Race
  def initialize
    super(20, 8, 8, 10, 10)
  end
end
