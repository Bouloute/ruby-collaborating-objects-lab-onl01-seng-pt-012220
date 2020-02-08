class MP3Importer

  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    #I stole this and have no idea why it works. Just bein' honest
     @files = Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
  end

  def import
    files.each{|song|
      Song.new_by_filename(song)
    }
  end
end
