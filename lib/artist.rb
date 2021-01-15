class Artist
    attr_accessor :name

    @@all=[]
    def initialize(name)
        @name=name
        save
    end
    def save
        @@all<<self
    end

    def self.all
        @@all
    end

    def songs
        #binding.pry
        Song.all.select{|song| song.artist==self}
    end

    def self.find_by_name(artist_name)
        self.all.find{|artist| artist.name == artist_name}
    end

    def self.find_or_create_by_name(artist_name)

        if find_by_name(artist_name)
            find_by_name(artist_name)
        else
            self.new(artist_name)
        end
    end

    def print_songs
        song_list = Song.all.each_with_object([]) do |song, song_list| 
            if song.artist==self
                song_list << song.name
            end
        end
        puts song_list
    end

    def add_song(song)
        song.artist = self
    end

end