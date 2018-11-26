class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name=(name)
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save << song
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end


  def self.alphabetical
    self.all.sort_by {|song| song.name}.uniq
  end

  def self.new_from_filename(file_name)
    song = self.new
    artist_name = file_name.match(/^\w+\s\w+/)
    song_name = file_name.scan(/-.+[^\.mp3].join("- ")
    song.name=(song_name)
    song.artist=(artist_name)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
