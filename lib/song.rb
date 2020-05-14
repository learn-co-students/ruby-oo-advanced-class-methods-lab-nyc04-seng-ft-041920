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
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    @@all << song
    song
  end

  def self.find_by_name(title)
    self.all.find do |song|
      song.name == title
    end
  end

  def self.find_or_create_by_name(title)
    find_by_name(title) ? find_by_name(title) : create_by_name(title)
    # is this ugly
  end

  def self.alphabetical
    self.all.sort_by do |title|
      title.name
    end
  end

  def self.new_from_filename(file_name)
    file = file_name.split(/\s- |\./) # regex go \\\\\\\\\\\\\\\\\\\
    song = self.create
    song.artist_name = file[0]
    song.name = file[1]
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    # binding.pry
  end

  def self.destroy_all
    self.all.clear
  end

end
