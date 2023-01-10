require_relative "./books/books_handler"
require_relative "./label/label_handler"
class Main
  def initialize
    @label = LabelHandler.new
    @books = BooksHandler.new(@label)
  end
  def start_console
    puts 'Welcome to Catalog App'

    options = {
      'List all books' => :list_books,
      'List all music albums' => :list_music_albums,
      'List all movies' => :list_movies,
      'List all games' => :list_games,
      'List all genres' => :list_genres,
      'List all labels' => :list_labels,
      'List all authors' => :list_authors,
      'List all sources' => :list_sources,
      'Add a book' => :add_book,
      'Add a music album' => :add_music_album,
      'Add a movie' => :add_movie,
      'Add a game' => :add_game
    }

    loop_method(options)
  end

  def loop_method(options)
    puts 'Please choose an option by selecting a number'
    loop do
      options.each_with_index do |(option, _), index|
        puts "#{index + 1}) #{option}"
      end

      puts 'Insert any key to exit'
      puts ''
      input = gets.chomp.to_i
      if input.positive? && input <= 13
        case input
          when 1
            @books.list_books
          when 6
            @label.list_labels
          when 9
            @books.add_book
          else
            options.values[input]
        end
        options.values[input]
      else
        puts 'Thank you for using this app'
        break
      end
    end
  end
end

main = Main.new
main.start_console
