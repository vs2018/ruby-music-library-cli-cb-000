require_relative '../config/environment.rb'
require 'pry'

class MusicLibraryController
  
  attr_accessor :path, :library, :list_songs
  
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    4.times do 
      input = gets
     
    end
    
  end
  
  def list_songs
    sorted = Song.all.sort_by {|obj| obj.name}
    counter = 1
  
    sorted.map do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end
  
  def list_artists
    sorted = Artist.all.sort_by {|obj| obj.name}
    counter = 1
    sorted.map do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end
  
  def list_genres
    sorted = Genre.all.sort_by {|obj| obj.name}
    counter = 1
    sorted.map do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    artist = Artist.find_or_create_by_name(input)
    sorted = artist.songs.sort_by {|obj| obj.name}
    counter = 1
    sorted.each do |song|
      puts "#{counter}. #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
    genre = Genre.find_or_create_by_name(input)
    sorted = genre.songs.sort_by {|obj| obj.name}
    counter = 1
    sorted.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name}"
      counter += 1
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"

    input = gets.to_i 
    
    
    
    
    if (1..self.list_songs.length).include?(input)
      song = self.list_songs[input - 1]
    end
    
    array = song.split(/[.-]/) if song

    puts "Playing #{array[2]} by #{array[1]}" if song
  end
  

  
  
    
  
  
  
end

