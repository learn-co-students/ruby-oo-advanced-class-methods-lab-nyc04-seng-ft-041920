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
    new_song =  self.new
    @@all << new_song
    new_song
  end 

  def self.new_by_name(song_name)
    new_song = self.new 
    new_song.name = song_name
    new_song
  end 

  def self.create_by_name(song_name)
    new_song = self.new 
    new_song.name = song_name
    @@all << new_song 
    new_song
  end 
  

  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end 

  def self.find_or_create_by_name(song_name)
    found_song = self.find_by_name(song_name) 
    found_song ? found_song : self.create_by_name(song_name)
  end 

  def self.alphabetical 
    # songs_names = @@all.map {|song| song.name}.sort 
    # songs_names.map {|song| self.find_by_name(song)}
    @@all.sort_by{|song| song.name}
  end 
    private 
    #helper method that will return song and artist name in array 
  def self.file_name_parser(file_string)      
    string_arr = file_string.split(/\.|\-/)
    [string_arr[0], string_arr[1]]  
  end 

  def self.new_from_filename(file_string)
    string_arr = file_name_parser(file_string)
    new_song = self.new_by_name(string_arr[1].strip)
    new_song.artist_name = string_arr[0].strip
    new_song
  end 

  def self.create_from_filename(file_string)
    string_arr = file_string.split(/\.|\-/)    
    new_song = self.create_by_name(string_arr[1].strip)
    new_song.artist_name = string_arr[0].strip 
  end 

  def self.destroy_all 
    self.all.clear 
  end

end
