require_relative '../item'
# Create a Game class in a separate .rb file.
# All Game class properties visible in the diagram should be defined and set up in the constructor method.
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super()
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def can_be_archived?
    super && (Time.now.year - @last_played_at).to_i > 2
  end
end
