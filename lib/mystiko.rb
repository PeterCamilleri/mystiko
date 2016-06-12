# coding: utf-8

require_relative "mystiko/encrypt"
require_relative "mystiko/decrypt"
require_relative "mystiko/generator"
require_relative "mystiko/inputs"
require_relative "mystiko/outputs"
require_relative "mystiko/version"

# The Mystiko class is where all the data encryption code resides.
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
