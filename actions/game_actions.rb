require './classes/game'
require './classes/author'
require 'json'

class GameActions
  attr_accessor :games, :authors

  def initialize
    @games = load_games
    @authors = load_authors
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

  def list_games
    if @games.empty?
      puts 'No games available yet!'
    else
      @games.each do |game|
        puts "
          Game id: #{game.id}
          Multiplayer: #{game.multiplayer == 'y' ? 'Yes' : 'No'}
          Game last played at : #{game.last_played_at}
          Published on : #{game.publish_date}
          "
      end
    end
  end

  def list_authors
    if @authors.empty?
      puts 'no authors available!'
    else
      @authors.each do |author|
        puts "
          Author's id: #{author.id}
          Author's name: #{author.first_name}
          Author's lastname: #{author.last_name}
        "
      end
    end
  end

  def load_games
    data = []
    file = './data/games.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |game|
        data.push(Game.new(game['multiplayer'], game['last_played_at'], game['publish_date']))
      end
    else
      File.write(file, [])
    end
    data
  end

  def load_authors
    data = []
    file = './data/authors.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |author|
        data.push(Author.new(author['first_name'], author['last_name']))
      end
    else
      File.write(file, [])
    end
    data
  end

  def save_games
    data = []
    @games.each do |game|
      data.push({ id: game.id,
                  multiplayer: game.multiplayer,
                  last_played_at: game.last_played_at,
                  publish_date: game.publish_date })
    end
    File.write('./data/games.json', JSON.pretty_generate(data))
  end

  def save_authors
    data = []
    @authors.each do |author|
      data.push({ id: author.id, first_name: author.first_name, last_name: author.last_name })
    end
    File.write('./data/authors.json', JSON.pretty_generate(data))
  end
end
