require_relative './item'

class Game < Item
  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @id = Random.rand(1..10_000)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @publish_date = publish_date
  end

  attr_accessor :multiplayer, :last_played_at
  attr_reader :publish_date, :id

  def can_be_archived?
    super && (parse(@last_played_at).year < Date.today.year - 2)
  end
end
