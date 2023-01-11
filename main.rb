require_relative './game_files/options_handler'
class Main
  def initialize
    @games = []
    @authors = []
  end

  include OptionsHandler

  def start_console
    puts 'Welcome to Catalog App'
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
    puts 'Please choose an option by selecting a number'
    loop do
      options.each_with_index do |(option, _), index|
        puts "#{index + 1}) #{option}"
      end

      puts 'Insert any key to exit'
      input = gets.chomp.to_i
      if input.positive? && input <= 13
        send(options.values[input - 1])
      else
        puts 'Thank you for using this app'
        break
      end
    end
  end
end

main = Main.new
main.start_console
