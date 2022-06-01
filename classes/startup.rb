require_relative 'game_actions'

class Startup
  def options_list
    puts "\nPlease choose an option by selecting a number:
    1. List all books
    2. List all musics
    3. List of games
    4. Add a book
    5. Add a music
    6. Add a game
    7. Exit"
    choice = gets.chomp
    selection(choice.to_i)
  end

  def selection(choice)
    methods = [
      method(:booklist), method(:musiclist), method(:gamelist),
      method(:create_book), method(:create_music), method(:create_game), method(:quite_app)
    ]
    (1..7).include?(choice) && methods[choice - 1].call
  end

  def booklist
    puts 'book list in library'
  end

  def musiclist
    puts 'Music list in library'
  end

  def gamelist
    puts 'Game list in library'
  end

  def create_book
    puts 'create book'
  end

  def create_music
    puts 'create music'
  end

  def create_game
    # puts 'create game'
    game_actions = GameActions.new
    game_actions.add_a_game
  end

  def quite_app
    puts 'Thanks for using our app'
    exit
  end

  def start
    options_list
  end
end
