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
    @authors.each do |author|
      puts "Author #{author.first_name} #{author.last_name} is now on the list"
    end
  end

  def add_game
    puts 'Is this game in multiplayer mode? true or false'
    multiplayer = gets.chomp
    puts 'When was this game last played'
    last_played_at = gets.chomp
    new_game = Game.new(multiplayer, last_played_at)
    puts 'Game is now online'
    @games << new_game
  end
end
