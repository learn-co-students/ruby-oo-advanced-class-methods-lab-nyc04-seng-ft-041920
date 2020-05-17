require "pry"

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
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    # self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) ? self.find_by_name(song_name) : self.create_by_name(song_name)
  end

  def self.alphabetical 
    self.all.sort_by { |song_obj| [song_obj.name]}
  end

  def self.new_from_filename(file_name) 
    file_name.slice!(".mp3")
    data = file_name.split(" - ")
    song = Song.new
    song.name = data[1]
    song.artist_name = data[0]
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end
end

track_1 = Song.create
track_1.name = "Starboy"
track_1.artist_name = "TheWeeknd"

track_2 = Song.new_by_name("Blinded By The Lights")

track_3 = Song.create_by_name("Heartless")

found = Song.find_by_name("Heartless")

find_create_1 = Song.find_or_create_by_name("Heartless")
find_create_2 = Song.find_or_create_by_name("Too Late")
find_create_3 = Song.find_or_create_by_name("Alone Again")

Song.alphabetical
# song = Song.new_from_filename("TheWeeknd - Faith.mp3")
# song.name
# song.artist_name


song = Song.create_from_filename("TheWeeknd - Faith.mp3")
binding.pry

Song.destroy_all
binding.pry