require 'pry'

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
    # first created a local variable to assign it a instance of a song
    song = self.new
    # unsing that variable i called the instance method 'save' to push it into the class @@all variable
    song.save
    # return the instance
    song
  end

  def self.new_by_name song_name
    # created a local var and assign it a Song instance
    song = self.new
    # access the name method 'name=' and assign the argument that was passed
    song.name = song_name
    # return the instance
    song
  end

  def self.create_by_name song_name
    # assign an instance to a local var
    song = self.new
    # access the name method 'name=' and assign the argument that was passed
    song.name = song_name
    # then save the instance using the instance method 'save'
    song.save
    # return the instance
    song
  end

  def self.find_by_name song_name
    # This is a Class Finder so what its main function is to find and specific data.
    # here i use a the array method/enumerable "detect" that finds the first element that the block returns true.
    self.all.detect do |song_object|
      # here the song_object is each song in the Class Variable @@all
      # so we want to access the name method and see if is equal to the song string we are trying to find. which "song_name"
      song_object.name == song_name
    end
  end

  def self.find_or_create_by_name song_name
    # binding.pry
    # here we just called both Class Methods we just build and passed the argument. we are going to return the one that is true || = 'or'
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort do |first_object ,second_object |
      # binding.pry
      # below we are simply comparing first_object with the second one
      # the spaceship operator either returns -1, 0, 1,
      # this happens to make in order by name
      first_object.name <=> second_object.name
    end
  end

  def self.new_from_filename filename
    # first we create a instance and stored it in a local var
    song_instance = self.new
    # we are going split the filename thats passed as an argument, by ' - '. so its going to give us an array
    file_array = filename.split(' - ')
    # so now we set the artist_name to the first element in file_array
    song_instance.artist_name = file_array[0]
    # the same with the song name, but a way i found to get rid of the '.mp3' is to split it between '.' and then get the first element
    # ['Blank Space', 'mp3']
    song_instance.name = file_array[1].split('.')[0]
    # return that instance
    song_instance
  end

  def self.create_from_filename filename
    # Store and instance with the filename parsed into a var 'song_parsed'
    song_parsed = self.new_from_filename(filename)
    # then we simply use the 'save' instance method on our instance
    song_parsed.save
  end

  def self.destroy_all
    # we call the all method which returns an array with all the song objects and then we chain it to a clear method that removes all the data from the array.
    self.all.clear
  end

end

