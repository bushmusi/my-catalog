require './music_album'
require './genre'

class MusicActions
    attr_accessor :music, :genres

    def initialize
        @music = []
        @genres = []
end
