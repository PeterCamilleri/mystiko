# coding: utf-8

require_relative "mystiko/version"

# The Mystiko module is where all the data encryption code resides.
module Mystiko

  @filler = Random.new

  #Get a decoy filler byte.
  def self.filler_byte
    @filler.rand(256)
  end


end
