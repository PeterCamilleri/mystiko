# coding: utf-8

#Data encryption.
class Mystiko

  #Perform data encryption
  def encrypt(args={})
    process_inputs(args)
    setup_clear_input
    do_encryption
    setup_cypher_output
    process_outputs(args)
  end

  #Get the clear (aka unencrypted) input data set up.
  def setup_clear_input
    temp    = @input.bytes
    @input  = "#{temp.length.to_s(36)};".bytes + temp
    @length = @input.length
    @data   = @input[0...@window]

    (@window - (@offset = @data.length)).times do
      @data << @filler.call
    end
  end

  #Do the actual encryption work.
  def do_encryption
  end

  #Get the cypher (aka encrypted) output data set up.
  def setup_cypher_output
  end

end
