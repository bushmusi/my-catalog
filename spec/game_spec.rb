require_relative '../classes/game'

describe Game do
  before :each do
    @game = Game.new true, '2022-02-22', '2020-02-20'
  end

  context 'initialization of a new game' do
    it 'takes three parameters and returns a Game object' do
      @game.should be_an_instance_of Game
    end

    it 'returns the correct value for Multiplayer' do
      @game.multiplayer.should eql true
    end

    it 'returns the correct value for last played date' do
      @game.last_played_at.should eql '2022-02-22'
    end

    it 'returns the correct value for publish date' do
      @game.publish_date.should eql '2020-02-20'
    end
  end

  context 'can_be_archived? method test' do
    it 'game cant be arcivable (less than 2 years since release)' do
      expect(@game.can_be_archived?).to eql(false)
    end
  end
end
