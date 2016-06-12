# coding: utf-8

require_relative "mystiko/version"

# The Mystiko module is where all the data encryption code resides.
class Mystiko

  #Set up an encryption object.
  def initialize
    @filler = Random.new
  end

  #Get a decoy filler byte.
  def filler_byte
    @filler.rand(256)
  end


end
