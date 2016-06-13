# coding: utf-8

#Common output parameter processing.
class Mystiko

  #Perform common output argument processing.
  def process_outputs(args)
    @input, @generator, @window, @data = nil, nil, nil, nil

    if (name = args[:out_file])
      IO.write(name, @output)
    elsif (out_str = args[:out_str])
      out_str << @output
    end

    (_, @output = @output, nil)[0]
  end

end

