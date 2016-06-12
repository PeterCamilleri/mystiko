# coding: utf-8

#Data encryption.
class Mystiko

  #Perform data encryption
  def encrypt(args={})
    process_inputs(args)
    setup_clear_input

  end

  #Get the input data set up.
  def setup_clear_input
    temp    = @input.bytes.to_a
    @input  = "#{temp.length.to_s(36)};".bytes + temp
    @length = @input.length
    @data   = @input[0...@window]

    (@window - (@offset = @data.length)).times do
      @data << @filler.call
    end
  end

end
