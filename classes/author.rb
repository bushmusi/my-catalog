require_relative './item'

class Author
  def initialize(first_name, last_name)
    @id = Random.rand(1..10_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  attr_accessor :id, :first_name, :last_name, :items

  def add_item(item)
    @items.push(item)
    item.author = self
  end
end
