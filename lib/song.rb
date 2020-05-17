#5/16/2020 6:48pm - 7:32pm 
#8:32pm - 9:07pm

require 'pry'
class Song
  attr_accessor :name, :artist_name #instances have name and artist_name properties. 

  @@all = [] #class variable : storing all instances for Song, getting from "save" method. 

  def self.all
    @@all
  end

  def save #instance method 
    self.class.all << self
  end

  def self.create  #class constructor #?? why self.?? 
      song = Song.new
      song.save
      song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.detect {|each| each.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
 
    @@all.sort_by { |each_song| each_song.name}

  end
  # def self.alphabetical  #test spec answer is different but this works on repl
  #   sort_arr = []
  #   self.all.sort_by{|each_song| sort_arr << each_song.name}
  #   sort_arr
  # end


  def self.new_from_filename(file_format)
    file_format.split(" - ")
    artist_name = file_format.split(" - ")[0]
    song_name = file_format.split(" - ")[1].gsub('.mp3', '')
    
    #.gsub ('.mp3') it deletes that connected(consecutive) letters
    #.delete(".mp3") #it deletes all m, p, and 3 in the sentence.
    #.tr('.mp3', '') #same as .delete 

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_format)
    parts = file_format.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub('.mp3', '')
    
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end




