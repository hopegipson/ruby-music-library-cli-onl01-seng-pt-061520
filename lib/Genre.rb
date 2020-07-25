class Genre
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

    def Genre.all
        @@all
    end

    def Genre.create(name)
       genre1 = Genre.new(name)
       genre1.save
       genre1
    end

    def Genre.destroy_all
        @@all.clear
    end

    def artists
        self.songs.collect {|song| song.artist}.uniq
    end

end