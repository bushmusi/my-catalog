require './classes/game'
require './classes/author'

class GameActions
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def add_a_game
    puts 'Is it a multiplayer game? [Y/N]: '
    multiplayer = gets.chomp.downcase

    puts 'Last played at (yyyy-mm-dd): '
    last_played_at = gets.chomp

    puts 'Publish date (yyyy-mm-dd): '
    publish_date = gets.chomp

    game = Game.new(multiplayer, last_played_at, publish_date)
    @games.push(game)

    puts 'Author first name: '
    first_name = gets.chomp
    puts 'Author last name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)

    author.add_item(game)
    @authors.push(game.author)
    puts "\nGame added successfully.\n"
  end
end
