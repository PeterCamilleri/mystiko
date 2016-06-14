# coding: utf-8

require 'English'

#* decrypt.rb -- Data decryption.
class Mystiko

  #Perform data decryption
  def decrypt(args={})
    process_inputs(args)
    setup_cypher_input
    do_decryption
    setup_clear_output
    process_outputs(args)
  end

  #Get the cypher (aka encrypted) input data set up.
  def setup_cypher_input
    @input   = @input.bytes
    @offsets = (0...@window).to_a
    @offset  = @window
  end

  #Do the actual decryption work.
  #<br>Endemic Code Smells
  #* :reek:TooManyStatements
  def do_decryption
    result = Array.new(@input.length + @window, 32)

    @input.each do | value |
      index = @generator.rand(@window)
      result[@offsets[index]] = value ^ @generator.rand(256)

      @offsets.delete_at(index)
      @offsets << @offset
      @offset += 1
    end

    @output = result.pack("C*")
  end

  #Get the clear (aka unencrypted) output data set up.
  def setup_clear_output
    @offsets = @offset = nil

    if /^[0-9a-z]+;/ =~ @output
      @output = $POSTMATCH[0...($MATCH.to_i(36))]
    else
      fail "Unable to recover data."
    end
  end

end
