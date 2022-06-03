require 'date'
require_relative './book-store/label'

class Item
  attr_accessor :publish_date, :archived, :id
  attr_reader :author, :genre, :source, :label

  def initialize(publish_date = Time.new.strftime('%Y-%m-%d'), archived: false)
    @id = Random.rand(1..10_000)
    @publish_date = publish_date
    @archived = archived
    @label = nil
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include? self
  end

  def author=(author)
    @author = author
    @author.items.push(self) unless @author.items.include?(self)
  end

  def source=(source)
    @source = source
    @source.items.push(self) unless @source.items.include?(self)
  end

  def add_label(label)
    label.is_a?(Label) && @label.nil? && (
      @label = label
      label.add_item(self)
    )
    puts 'There is already a label. You can\'t change it' unless @label.nil?
    return if label.is_a?(Label)

    puts 'Wrong parameter. This method only accepts instances of the Label class'
  end

  def can_be_archived?
    @publish_date.to_i < Date.today.year - 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
