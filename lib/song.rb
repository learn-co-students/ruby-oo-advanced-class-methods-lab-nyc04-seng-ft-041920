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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song.save 
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename_arr = filename.split(" - ")
    filename_arr[1].slice!(".mp3")
    song = self.create_by_name(filename_arr[1])
    song.artist_name = filename_arr[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end


# the_box = Song.new_by_name("The Box")
# p the_box.name
# toosie_slide = Song.create_by_name("Toosie Slide")
# p toosie_slide
# the_box = Song.create_by_name("The Box")
# say_so = Song.create_by_name("Say So")

# p Song.alphabetical

# p Song.new_from_filename("Taylor Swift - Blank Space.mp3")
# pp Song.all

# p Song.find_by_name("The Box")

# p toxic1 = Song.find_or_create_by_name("Toxic")
# p toxic2 = Song.find_or_create_by_name("Toxic")


