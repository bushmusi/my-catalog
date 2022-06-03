require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  before :each do
    @author = Author.new 'Zahra', 'Arshia'
  end

  context 'initialization of a new author' do
    it 'takes three parameters and returns a Game object' do
      @author.should be_an_instance_of Author
    end

    it 'returns the correct value for first name' do
      @author.first_name.should eql 'Zahra'
    end

    it 'returns the correct value for last name' do
      @author.last_name.should eql 'Arshia'
    end
  end

  context 'add_item method test' do
    it 'should add new author item' do
      new_item = Item.new '2020-02-02'
      @author.add_item(new_item)
      expect(@author.items).to eql([new_item])
    end
  end
end
