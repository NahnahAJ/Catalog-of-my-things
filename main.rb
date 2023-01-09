class Main
  def start_console
    puts 'Welcome to Catalog App'

    loop_method
  end

  def select_an_option
    {
      'List all books' => 'list_books',
      'List all music albums' => 'list_music_albums',
      'List all movies' => 'list_movies',
      'List all games' => 'list_games',
      'List all genres' => 'list_genres',
      'List all labels' => 'list_labels',
      'List all authors' => 'list_authors',
      'List all sources' => 'list_sources',
      'Add a book' => 'add_book',
      'Add a music album' => 'add_music_album',
      'Add a movie' => 'add_movie',
      'Add a game' => 'add_game'
    }
  end

  def loop_method
    options = select_an_option
    loop do
      options.each_with_index do |option, index|
        puts "option #{index + 1} : #{option[0]}"
      end

      puts 'Insert any key to exit'
      input = gets.chomp
      if input >= 13
        puts 'Thank you for using this app'
        break
      end
    end
  end
end

main = Main.new
main.start_console
