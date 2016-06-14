# coding: utf-8

#* inputs.rb -- Common input parameter processing.
class Mystiko

  # The array of input bytes
  attr_reader :input

  # The sliding window size.
  attr_reader :window

  # The source of simulated entropy
  attr_reader :generator

  #Perform common input argument processing.
  def process_inputs(args)
    @input = ((name = args[:in_file]) && (IO.read(name, mode: "rb"))) ||
             args[:in_str]                                            ||
             fail("An input must be specified.")

    @generator = args[:generator]                              ||
                 ((key = args[:key]) && Generator.new(key))    ||
                 fail("A key or generator must be specified.")

    @window = args[:window] || 16

    #The filler value is for testing purposes only. It should
    #not be specified when secure operation is desired.
    @fill_value = args[:filler]
  end

end
