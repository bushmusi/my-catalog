require './music_album'
require './genre'

class MusicActions
    attr_accessor :music, :genres

    def initialize
        @musics = load_musics
        @genres = load_genres
    end

    def add_a_music
        puts 'Is it archived? [Y/N]: '
        archived = gets.chomp.downcase
    
        puts 'Is it on spotify? [Y/N]: '
        on_spotify = gets.chomp.downcase
    
        puts 'Publish date (yyyy-mm-dd): '
        publish_date = gets.chomp
    
        music = MusicAlbum.new(archived, on_spotify, publish_date)
        @musics.push(music)
    
        puts 'what is the name of the genre: '
        name = gets.chomp
        genre = Genre.new(name)
    
        genre.add_item(music)
        @genres.push(music.genre)
        puts "\nMusicAlbum added successfully.\n"
    end

    def list_music
        if  @musics.empty?
          puts 'No music available yet!'
        else
            @musics.each do |music|
            puts "
              Music id: #{music.id}
              Archived: #{music.archived == 'y' ? 'Yes' : 'No'}
              On spotify : #{music.on_spotify}
              Published on : #{music.publish_date}
              "
          end
        end
      end
    
      def list_genres
        if @genres.empty?
          puts 'no genres available!'
        else
          @genres.each do |genre|
            puts "
              genre's id: #{genre.id}
              genre's name: #{genre.name}
            "
          end
        end
      end  
end

