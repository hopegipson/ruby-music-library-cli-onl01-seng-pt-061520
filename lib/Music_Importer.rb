class MusicImporter
    attr_accessor :path
    @@all = []

    def initialize(path)
        self.path = path
        @@all << self
    end

    def files
        Dir.glob("#{@path}/*.mp3").collect {|f| f.gsub("#{@path}/", "")}
    end

    def import
        files.each {|file| Song.create_from_filename(file)}
      end

end