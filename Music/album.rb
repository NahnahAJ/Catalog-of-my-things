require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name

  def initialize(name, on_spot, publish_date)
    super(publish_date, false)
    @name = name
    @on_spotify = on_spot
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_hash
    {
      name: @name,
      on_spotify: @on_spotify ? 'y' : 'n',
      genre: @genre.name,
      publish_date: @publish_date.to_s
    }
  end
end
