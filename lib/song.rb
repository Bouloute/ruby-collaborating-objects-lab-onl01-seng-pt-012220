require('pry')
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
    new_song.artist_name = Artist.find_or_create_by_name(song_info[0])
    binding.pry
    new_song
  end
  
  def artist_name= (artist_name)
    found_artist = Artist.all.find{ |artist| artist.name == artist_name}
    
    if found_artist == nil
      found_artist = Artist.new(artist_name)
    end
    found_artist.add_song(self)
    
  end
end
