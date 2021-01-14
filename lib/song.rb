class Song
    attr_accessor :name, :artist

    @@all=[]

    def initialize (name)
        @name=name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        data = filename.split(" - ")
        new_song=self.new(data[1])
        new_song.artist = data[0]
        Artist.find_or_create_by_name(data[0])
        new_song
    end

    def artist_name=(name_of_artist)
        self.artist = Artist.find_or_create_by_name(name_of_artist)
    end


end


