# coding: utf-8

require 'fibonacci_rng'
require 'composite_rng'

#The internal pseudo-random number generator.
class Mystiko

  #A specialized variant of the composite pseudo RNG.
  class Generator < CompositeRng

    #Create the default pseudo random data generator.
    #<br> Endemic Code Smells
    #* :reek:FeatureEnvy
    def initialize(key)
      parent = FibonacciRng.new(key)
      child = Random.new(parent.hash_value)
      super(parent, child, 31, 31)
    end

  end

end
