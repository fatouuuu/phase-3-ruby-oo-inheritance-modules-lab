require 'pry'
require_relative '../lib/concerns/memorable'
require_relative '../lib/concerns/findable'
require_relative '../lib/concerns/paramble'


class Artist
  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  include Paramble::InstanceMethods


  attr_accessor :name
  attr_reader :songs
  @@artists = []

  def initialize
    @@artists << self
    @songs = []
  end

  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  # def to_param
  #   name.downcase.gsub(' ', '-')
  # end

  def self.find_by_name(name)
    all.detect { |artist| artist.name == name }
  end
end
