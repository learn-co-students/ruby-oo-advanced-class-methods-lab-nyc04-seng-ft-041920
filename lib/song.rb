class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
     song = Song.new
     @@all << song
     song
  end

  def self.new_by_name(song_name)
    
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) ? self.find_by_name(song_name) : self.create_by_name(song_name)
    
    # self.find_by_name(song_name)
    # if self.find_by_name(song_name) == false
    #   self.create_by_name(song_name)
    # end
  end

  def self.alphabetical
    @@all.sort_by {|song| [song.name]}
      
  end

  def self.new_from_filename(str)
    array = str.strip.split(/[-.]/)
    song = Song.new
    song.artist_name = array[0].strip
    song.name = array[1].strip
    @@all << song
    song
  end

  def self.create_from_filename(str)
    array = str.strip.split(/[-.]/)
    song = Song.new
    song.artist_name = array[0].strip
    song.name = array[1].strip
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end




end
