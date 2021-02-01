class Song

    attr_accessor :name, :artist
    
    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_name = filename.split(" - ")[1]
        new_song = self.new(song_name)
        artist_name = filename.split(" - ")[0]
        new_song.artist = Artist.find_or_create_by_name(artist_name)
        return new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

end