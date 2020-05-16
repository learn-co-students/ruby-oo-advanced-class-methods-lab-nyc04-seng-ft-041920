require ('pry')
class Song

  attr_accessor :name, :artist_name
  @@all = []
#  
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
  
  def self.new_by_name(song)
      new_song = self.new
      new_song.name = song
      new_song
  end

  def self.create_by_name(song)
    another_song = self.new
    another_song.name = song
    @@all << another_song 
    another_song
  end

  def self.find_by_name(song)
    found_song = nil
    self.all.find do |songs|
     if songs.name == song
       found_song = songs
     end
    end
    found_song
  end
  
  def self.find_or_create_by_name(song)
    if self.find_by_name(song)
      self.find_by_name(song)
    else 
      self.create_by_name(song)
    end
  end
  
  def self.alphabetical
    self.all.sort_by { |song|song.name}
  end

  def self.new_from_filename(song)
    song = song[0..song.length-5]
    song = song.split(" ")
    i = song.find_index("-")
    name = song[0..i-1].join(' ')
    song = song[i+1..-1].join(' ')
    new_song = self.new 
    new_song.name = song  
    new_song.artist_name = name
    new_song
  end
  def self.create_from_filename(song)
    song = self.new_from_filename(song)
    song.save 
  end

  def self.destroy_all
    @@all.clear
  end
  
end  
# people.sort_by { |name, age| age }
  # => [[:joan, 18], [:fred, 23], [:pete, 54]]