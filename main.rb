require_relative 'genre'
require_relative 'album'

class Main
  def initialize
    @genres = []
    @albums = []

    start_console
  end

  def start_console
    puts "\nWelcome to Catalog App\n\n"

    options = {
      'List all books' => :list_books,
      'List all music albums' => :list_music_albums,
      'List all games' => :list_games,
      'List all genres' => :list_genres,
      'List all labels' => :list_labels,
      'List all authors' => :list_authors,
      'Add a book' => :add_book,
      'Add a music album' => :add_music_album,
      'Add a game' => :add_game
    }

    loop_method(options)
  end

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

  def loop_method(options)
    loop do
      puts "\nPlease choose an option by selecting a number"
      options.each_with_index do |(option, _), index|
        puts " #{index + 1}) #{option}"
      end

      puts "\n--Insert any key to exit"
      input = gets.chomp.to_i
      if input.positive? && input <= 9
        send(options.values[input - 1])
      else
        puts "\nThank you for using this app\n\n"
        break
      end
    end
  end

  private

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

Main.new
