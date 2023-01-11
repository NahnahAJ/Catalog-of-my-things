require_relative '../item'
class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :id

  def initialize(publisher, cover_state, publish_date)
    super(publish_date, false)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_json(*_args)
    { 'id' => @id,
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'publish_date' => @publish_date }
  end
end
