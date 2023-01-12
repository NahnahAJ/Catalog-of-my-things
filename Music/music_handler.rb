require_relative 'genre'
require_relative 'album'

module MusicHandler
  def music_album(inputs, confirmation)
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
    print "\n", inputs[0], " successfully added.\n" if confirmation
  end

  def list_music_albums
    puts "\nList of albums -:"
    @albums.each_with_index { |album, i| puts " #{i + 1}) #{album.name}" }
  end

  def list_genres
    puts "\nList of genres -:"
    @genres.each_with_index { |genre, i| puts " #{i + 1}) #{genre.name}" }
  end

  def add_music_album
    inputs = []
    print('Music album Name: ')
    inputs << gets.chomp
    print('Genre type: ')
    inputs << gets.chomp
    print('Published year [YYYY-MM-DD]: ')
    inputs << gets.chomp
    print('On spotify [y/n]: ')
    inputs << gets.chomp
    music_album(inputs, true)
  end

  def save_music
    @albums.each_with_index do |album, i|
      @albums[i] = album.to_hash
    end
    File.write('./Music/music_files/albums.json', JSON.generate(@albums))
  end

  def read_music
    return unless File.exist? './Music/music_files/albums.json'

    albums = JSON.parse(File.read('./Music/music_files/albums.json'))
    albums.each do |a|
      music_album([a['name'], a['genre'], a['publish_date'], a['on_spotify']], false)
    end
  end
end
