class Song

    attr_accessor :name, :artist, :genre
    extend Concerns::Findable


    @@all = []

    def save
        @@all << self
    end

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist= artist if artist != nil
        self.genre= genre if genre != nil
        #save
    end

    def Song.all
        @@all
    end

    def Song.create(name)
       song1 = Song.new(name)
       song1.save
       song1
    end

    def Song.destroy_all
        @@all.clear
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
          @genre = genre
          if genre.songs.include?(self) == false
            genre.songs << self
          end
        end

    def Song.new_from_filename(filename)
        splitfilename = filename.split(" - ")
        artist_name = splitfilename[0]
        song_name = splitfilename[1]
        genre_name = splitfilename [2].gsub(".mp3", "")
    
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
    
        new(song_name, artist, genre)
    end

    def Song.create_from_filename(filename)
        new_from_filename(filename).save
    end
    

  

end