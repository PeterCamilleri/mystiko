# coding: utf-8

#* outputs.rb -- Common output parameter processing.
class Mystiko

  #Access to the output instance variable
  #<br>Endemic Code Smells
  # :reek:Attribute -- Access needed for testing only.
  attr_accessor :output

  #Perform common output argument processing.
  #<br>Returns
  #* The output string.
  def process_outputs(args)
    @input = @generator = @window = @fill_value = nil   # Cover our tracks.

    if (name = args[:out_file])
      IO.write(name, @output, mode: "wb")
    elsif (out_str = args[:out_str])
      out_str << @output
    end

    (_, @output = @output, nil)[0]    # Return output and erase it.
  end

end
