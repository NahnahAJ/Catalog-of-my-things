require_relative './Music/music_handler'
require_relative './books/books_handler'
require_relative './label/label_handler'
require_relative './game_files/options_handler'

class Main
  include MusicHandler
  include OptionsHandler
  def initialize
    @label = LabelHandler.new
    @books = BooksHandler.new(@label)
    @genres = []
    @albums = []
    @games = []
    @authors = []

    read_music
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

  def loop_method(options)
    loop do
      puts "\nPlease choose an option by selecting a number"
      options.each_with_index do |(option, _), index|
        puts " #{index + 1}) #{option}"
      end
      puts "\n--Insert any key to exit"
      input = gets.chomp.to_i
      next unless input.positive? && input <= 9

      case input
      when 1
        @books.list_books
      when 5
        @label.list_labels
      when 7
        @books.add_book
      else
        send(options.values[input - 1])
        puts "\nThank you for using this app\n\n"
        save_music
        break
      end
    end
  end
end

Main.new
