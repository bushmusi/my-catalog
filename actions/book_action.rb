require_relative '../classes/book-store/book'
require_relative '../classes/book-store/label'
require_relative '../classes/book-store/file_manipulate'
require_relative '../classes/book-store/hash_make'
require 'json'

class BookAction
  attr_accessor :books, :labels

  def initialize
    @books = load_books
    @labels = load_labels
  end

  def add_book
    puts 'Publisher: '
    publisher = gets.chomp
    puts 'Cover state: '
    cover_state = gets.chomp
    puts 'Title: '
    title = gets.chomp
    puts 'color: '
    color = gets.chomp
    book = Book.new(publisher, cover_state)
    label = Label.new(title, color)
    hash_label = to_hash(label)
    book.label_id = hash_label['id']
    @books.push(to_hash(book))
    @labels.push(to_hash(label))
    puts "\nBook created successfully!!!\n"
  end

  def list_books
    if @books.empty?
      puts 'No book in library'
    else
      @books.each do |item|
        puts "\nID: #{item['id']} Publisher: #{item['publisher']} "\
             "Cover State: #{item['cover_state']} Label ID: #{item['label_id']}"
      end
    end
  end

  def load_books
    path = './data/books.json'
    data = []
    if read_file(path).empty?
      preserve_data(path, [])
    else
      read_file(path).each do |item|
        data.push(
          {
            'id' => item['id'], 'publisher' => item['publisher'],
            'cover_state' => item['cover_state'], 'label_id' => item['label_id']
          }
        )
      end
    end
    data
  end

  def save_books
    path = './data/books.json'
    data = []
    @books.each do |item|
      data.push(
        {
          'id' => item['id'], 'publisher' => item['publisher'],
          'cover_state' => item['cover_state'], 'label_id' => item['label_id']
        }
      )
    end
    preserve_data(path, data)
  end

  def list_labels
    if @labels.empty?
      puts 'No labels in library'
    else
      @labels.each do |item|
        puts "\nID: #{item['id']} Title: #{item['title']} "\
             "Color: #{item['color']}"
      end
    end
  end

  def load_labels
    path = './data/labels.json'
    data = []
    if read_file(path).empty?
      preserve_data(path, [])
    else
      read_file(path).each do |item|
        data.push({ 'id' => item['id'], 'title' => item['title'], 'color' => item['color'] })
      end
    end
    data
  end

  def save_labels
    path = './data/labels.json'
    data = []
    @labels.each do |item|
      data.push({ 'id' => item['id'], 'title' => item['title'], 'color' => item['color'] })
    end
    preserve_data(path, data)
  end
end
