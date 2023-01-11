require_relative 'game'
require_relative 'author'

module OptionsHandler
  def list_games
    if @games.empty?
      puts 'There are no games on the list'
    else
      # Check wheter the game instance is multiplayer or not
      @games.each do |game|
        if game.multiplayer == 'true'
          puts "Game is multiplayer and was last played at #{game.last_played_at}"
        else
          puts "Game is not multiplayer and was last played at #{game.last_played_at}"
        end
      end
    end
  end

  def list_authors
    if @authors.empty?
      puts 'There are no authors on the list'
    else

      @authors.each do |author|
        puts "Author #{author.first_name} #{author.last_name} is now on the list"
      end
    end
  end

  def add_game
    puts 'Please enter the multiplayer status of the game'
    multiplayer = gets.chomp
    puts 'Please enter the last played date of the game'
    last_played_at = gets.chomp
    puts 'Please enter the publish date of the game'
    publish_date = gets.chomp
    puts 'Please enter the archived status of the game'
    archived = gets.chomp

    new_game = Game.new(multiplayer, last_played_at, publish_date, archived)
    @games << new_game
    puts "Game #{new_game} was added to the list"
  end
end
