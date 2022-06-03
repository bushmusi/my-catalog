require_relative '../classes/music_album'
require_relative '../classes/item'

describe MusicAlbum do
  context 'when testing MusicAlbum class' do
    before(:each) do
      @music_album = MusicAlbum.new('2020-07-11', true, true)
    end

    it 'should check if instance of MusicAlbum is type of Item' do
      expect(@music_album.instance_of?(MusicAlbum)).to be true
    end

    it 'should check instance of on_spotify property' do
      instance_property = @music_album.on_spotify
      expect(instance_property).to be true
    end

    it 'should check can_be_archived? method' do
      @music_album.on_spotify = true
      @music_album.publish_date = '2000-11-29'
      @music_album.move_to_archive
      expect(@music_album.archived).to eq true
    end
  end
end
