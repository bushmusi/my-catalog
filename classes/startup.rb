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
    gets.chomp
  end

  def selection
    puts methods[options_list.to_i]
    methods = [
      method(:booklist), method(:musiclist), method(:gamelist),
      method(:create_book), method(:create_music), method(:create_game), method(:quite_app)
    ]
    (1..7).include?(options_list.to_i) && methods[options_list.to_i - 1].call
    selection
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
    puts 'create game'
  end

  def quite_app
    puts 'Thanks for using our app'
    exit
  end

  def start
    selection
  end
end
