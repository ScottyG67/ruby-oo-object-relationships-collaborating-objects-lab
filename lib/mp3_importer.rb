class MP3Importer
    attr_accessor :path

    @@all =[]
    def initialize(music_path)
        @path = music_path
        #binding.pry
        save
    end

    def save
        @@all << self
    end

    def files
        #binding.pry
        files_array = Dir[@path+"/*.mp3"]
        delete_path = @path+"/"
        clean_file_array = files_array.map {|file| file.delete_prefix(delete_path)}
    end
    def import
        files.each {|filename| Song.new_by_filename(filename)}
    end

    #class MP3Importer
    #    def import(list_of_filenames)
    #      list_of_filenames.each{ |filename| Song.new_by_filename(filename) }
    #    end
    #  end 

end
