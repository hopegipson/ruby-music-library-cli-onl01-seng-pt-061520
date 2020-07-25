
class Artist

    attr_accessor :name
    attr_reader :songs
    extend Concerns::Findable


    @@all = []

    def save
        @@all << self
    end

    def initialize(name)
        @name = name
        @songs = []

        #save
    end

    def Artist.all
        @@all
    end

    def Artist.create(name)
       artist1 = Artist.new(name)
       artist1.save
       artist1
    end

    def Artist.destroy_all
        @@all.clear
    end

    def add_song(song)
        if song.artist == nil && self.songs.include?(song) == false
        @songs << song
        song.artist = self
        elsif self.songs.include?(song) == false
            @songs << song
        end
    end

    def genres
        self.songs.collect {|song| song.genre}.uniq
    end


  #  def Artist.find_song(name)
  #  @@songs.includes?{|a| a.name == name}
   # end

end