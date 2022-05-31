require_relative './item'

class Game < Item
  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date, false)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  attr_accessor :multiplayer, :last_played_at, :publish_date

  def can_be_archived?
    super && (@last_played.year < Date.today.year - 2)
  end
end
