class Artist

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all.push(self)
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs.push(song)
    song.artist = self
  end

  def self.find_or_create_by_name(name)
    Artist.all.find{|artist| artist.name == name } || Artist.new(name)
  end

  def print_songs
    @songs.each{|song| puts song.name}
  end
end
