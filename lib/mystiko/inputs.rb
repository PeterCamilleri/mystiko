# coding: utf-8

#Common input parameter processing.
class Mystiko

  # The array of input bytes
  attr_reader :input

  # The sliding window size.
  attr_reader :window

  # The source of simulated entropy
  attr_reader :generator

  #Perform common input argument processing.
  def process_inputs(args)
    @input     = args[:in_str]                                ||
                 ((name = args[:in_file]) && (IO.read(name))) ||
                 fail("An input must be specified")


    @generator = args[:generator]                              ||
                 ((key = args[:key]) && Generator.new(key))    ||
                 fail("An key must be specified")

    @window    = args[:window] || 16
  end

end
