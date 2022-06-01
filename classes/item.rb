class Item
  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(publish_date, archived = false, _id = Random.rand(1..10_000))
    # @id = Random.rand(1..10_000)
    @publish_date = publish_date
    @archived = archived
  end
  # rubocop:enable Style/OptionalBooleanParameter

  attr_accessor :publish_date, :archived
  attr_reader :author, :genre, :source, :label, :id

  def genre=(genre)
    @genre = genre
    @genre.items.push(self) unless @genre.items.include?(self)
  end

  def author=(author)
    @author = author
    @author.items.push(self) unless @author.items.include?(self)
  end

  def source=(source)
    @source = source
    @source.items.push(self) unless @source.items.include?(self)
  end

  def label=(label)
    @label = label
    @label.items.push(self) unless @label.items.include?(self)
  end

  def can_be_archived?
    @publish_date.year < Date.today.year - 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
