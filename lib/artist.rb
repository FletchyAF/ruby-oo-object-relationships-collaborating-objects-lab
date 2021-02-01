class Artist

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

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
       @@all.find {|artist| artist.name == name} || Artist.new(name)
    end

    def print_songs
        all_songs = songs
        all_songs.each {|song| puts song.name}
    end

end