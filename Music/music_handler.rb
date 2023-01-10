require_relative 'genre'
require_relative 'album'

module MusicHandler
  def add_music_album
    inputs = music_input
    album = MusicAlbum.new(inputs[0].strip.capitalize,
                           inputs[3].strip[0].capitalize == 'Y', inputs[2])
    @albums << album
    genre = nil
    @genres.each do |g|
      if g.name == inputs[1].strip.capitalize
        genre = g
        break
      end
    end

    if genre.nil?
      genre = Genre.new(inputs[1].strip.capitalize)
      genre.add_item(album)
      @genres << genre
    else
      genre.add_item(album)
    end
  end

  def list_music_albums
    puts "\nList of albums -:"
    @albums.each { |album| puts album.name }
  end

  def list_genres
    puts "\nList of genres -:"
    @genres.each { |genre| puts genre.name }
  end

  def music_input
    inputs = []
    print('Music album Name: ')
    inputs << gets.chomp
    print('Genre type: ')
    inputs << gets.chomp
    print('Published year [yyyy]: ')
    inputs << gets.chomp
    print('On spotify [y/n]: ')
    inputs << gets.chomp
    inputs
  end
end
