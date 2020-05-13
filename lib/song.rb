class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name)
  #   @name = name
  # end

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

  def self.new_by_name(song)
    new_song = Song.new #instantiating instance of class Song
    new_song.name = song #setting the instance name of the new object equal to the song being passed in 
    new_song
  end

  def self.create_by_name(song)
    new_song = Song.create
    new_song.name = song
    new_song
  end

  def self.find_by_name(song)
    @@all.find { |ele| ele.name == song }
  end

  def self.find_or_create_by_name(song)
    if Song.find_by_name(song) #!= nil
      Song.find_by_name(song)
    else 
      Song.create_by_name(song)
    end
  end

  def self.alphabetical
    @@all.sort_by { |ele| ele.name }
  end

  def self.new_from_filename(filename)
    parsed = filename.split(" - ") #splitting on the -, first element will be the artists name, second element song name (but with .mp3 attached)
    #song_name = parsed.split(".mp3") # song_name[0] is the songs name because the second element is an empty string
    song_name = parsed[1].split(".mp3")

    new_song = Song.new
    new_song.name = song_name.join("")
    new_song.artist_name = parsed[0]
    new_song
    # Song.create_by_name(song_name)
  end

  def self.create_from_filename(filename)
    parsed = filename.split(" - ") 
    song_name = parsed[1].split(".mp3")

    new_song = Song.create
    new_song.name = song_name.join("")
    new_song.artist_name = parsed[0]
    new_song
  end

  def self.destroy_all
    @@all.clear
  end


end
