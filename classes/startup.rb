class Startup
  def options_list
    puts ''
    puts "Please choose an option by selecting a number:
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
    case options_list
    when '1'
      booklist
    when '2'
      musiclist
    when '3'
      gamelist
    when '4'
      create_book
    when '5'
      create_music
    when '6'
      create_game
    when '7'
      exit
    else
      puts 'Invalid input. Try again'
    end
    selection
  end

  def start
    selection
  end
end
