require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name

  def initialize(name, on_spot, publish_date)
    super(publish_date)
    @name = name
    @on_spotify = on_spot
  end

  def can_be_archived?
    super().can_be_archived? && @on_spotify
  end
end
