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
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.new_by_name(name)
    new_by_name = self.new
    new_by_name.name = name
    new_by_name
  end

  def self.create_by_name(name)
    create_by_name = self.create
    create_by_name.name = name
    create_by_name
  end

  def self.find_by_name(name)
    find_by_name = self.all.find do |song|
      name == song.name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      new_song = self.create_by_name(name)
      new_song
    else 
      found_name = self.find_by_name(name)
      found_name
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(filename)
    new_from_filename = self.new
    filename_array = filename.split(/[-.]/) - [""]
    new_from_filename.artist_name = filename_array[0].strip
    new_from_filename.name = filename_array[1].strip
    new_from_filename
  end

  def self.create_from_filename(filename)
    create_from_filename = self.create
    filename_array = filename.split(/[-.]/) - [""]
    create_from_filename.artist_name = filename_array[0].strip
    create_from_filename.name = filename_array[1].strip
  end

  def self.destroy_all
    self.all.clear
  end

end
