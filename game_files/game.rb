require_relative '../item'
# Create a Game class in a separate .rb file.
# All Game class properties visible in the diagram should be defined and set up in the constructor method.
class Game < Item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :publish_date, :archived

  def initialize(multiplayer, last_played_at, publish_date, archived)
    super(publish_date, archived)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def can_be_archived?
    super && Time.now.year - 2 > @last_played_at
  end

  def to_json(*args)
    {
      'id' => @id,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at
    }.to_json(*args)
  end
end
