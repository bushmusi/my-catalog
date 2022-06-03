require_relative '../classes/book-store/book'
require_relative '../classes/item'

describe Book do
  before :each do
    @book = Book.new('Mega', 'Beuty')
  end

  context 'Checking each property of book class' do
    it 'book variable should be an instance of Book' do
      expect(@book).to be_instance_of Book
    end

    it 'book variable should be kind of item' do
      expect(@book).to be_kind_of Item
    end
  end

  context 'Checking book property values' do
    it 'publisher should be Mega' do
      expect(@book.publisher).to eq 'Mega'
    end

    it 'cover state should be Beuty' do
      expect(@book.cover_state).to eq 'Beuty'
    end
  end
end
