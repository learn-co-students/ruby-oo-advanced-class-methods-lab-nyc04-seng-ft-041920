require('pry')
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    #binding.pry
    song.save #@@all << song / self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    #binding.pry
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    #binding.pry
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    #binding.pry
    self.all.sort_by{ |song| 
    #binding.pry 
    song.name}
  end

  def self.new_from_filename(filename)
    
    file = filename.split(/\-|\./)
    artist_name = file[0].strip
    name = file[1].strip

    song = self.new
    song.name = name
    song.artist_name = artist_name

    song
    # song.name = file[1]
    # song.artist_name = file[0]
  end

  def self.create_from_filename(filename)
    file = filename.split(/\-|\./)
    artist_name = file[0].strip
    name = file[1].strip

    song = self.create
    song.name = name
    song.artist_name = artist_name

    song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end

# song = Song.new_from_filename("Thundercat - For Love I Come.mp3")
# binding.pry