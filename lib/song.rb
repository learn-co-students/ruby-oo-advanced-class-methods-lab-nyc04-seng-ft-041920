
require('pry')

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
    new_song = self.new # Create a new instance of <Class: Song> :: new_song
    new_song.save       # Call save() on new_song() to store new song name
    new_song            # Call the new Instance
  end

  def self.new_by_name(song)
    new_by_name = self.new        # Create a new instance of <Class: Song> :: new_by_name
    new_by_name.name = song       # Set the value of new_by_name value to equal the argument (song)
    new_by_name                   # Call the new Instance
  end

  def self.create_by_name(song)
    create_by_name = self.create # Create a new instance of <Class: Song> :: create_by_name but do not! supply [block]
    create_by_name.name = song   # set the value of create_by_name value to equal the argument (song)
    create_by_name               # call the new Instance
  end

  def self.find_by_name(song)
    self.all.detect do |song_name|  # Searches the array @@all to check for equivalency between the element and argument.
      song_name.name == song        # Then returns the argument
    end
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song)      # Checks if self.find_by_name returns truthy
      self.find_by_name(song)       # if truthy: call self.find_by_name(song)
    else
      self.create_by_name(song)     # else if false: call self.create_by_name(song)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|      # sorts the array individually based on code block.
      song.name                     # sorts if song.name is not in alphabetical order of array
    end
  end

  def self.new_from_filename(file_name)
    song = self.new                             # Creates a new instance of <Class: Song> :: song
    halve_song = file_name.split(" - ")         # split the song into an array in front and back of " - " if " - " is true
    artist = halve_song[0]                      # artist name is stored into variable
    song_title = halve_song[1].split(".mp3")    #(".mp3", "") # sort array by RegEx of [^.mp3] and whitespace

    song.name = song_title.join("")             # set the song.name to the value of song_title after joining the individual element in the <Array: file_name>
    song.artist_name = artist                   # sets the song.artist_name to the value of artist
    song                                        # Calls the song instance
  end

  def self.create_from_filename(file_name)
    song = self.create                          # Creates a new instance of <Class: Song> :: song do not! supply [block]
    halve_song = file_name.split(" - ")         # split the song into an array in front and back of " - " if " - " is true
    artist = halve_song[0]                      # artist name is stored into variable
    song_title = halve_song[1].split(".mp3")    #(".mp3", "") # sort array by RegEx of [^.mp3] and whitespace

    song.name = song_title.join("")             # set the song.name to the value of song_title after joining the individual element in the <Array: file_name>
    song.artist_name = artist                   # sets the song.artist_name to the value of artist
    song                                        # Calls the song instance
  end

  def self.destroy_all
    @@all.clear
    @@all
  end
end
