class Song

  attr_accessor :artist, :name
  @@all = []

  def initialize(name)
    @name = name
    @@all.push(self)
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    song_info = filename.split(" - ")
    new_song = Song.new(song_info[1])
    new_song.artist_name = song_info[0]
    new_song
  end
  
  def artist_name= (artist_name)
    found_artist = Artist.find_or_create_by_name(artist_name)
    found_artist.add_song(self)
    
  end
end
