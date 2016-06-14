# coding: utf-8

#* encrypt.rb -- Data encryption.
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
      @data << filler_byte
    end
  end

  #Do the actual encryption work.
  def do_encryption
    result, processed = [], 0

    while processed < @length
      index = @generator.rand(@window)
      result << (@data.delete_at(index) ^ @generator.rand(256))

      @data << (@input[@offset] || filler_byte)
      @offset += 1

      processed += 1 if (index + processed) < @length
    end

    @output = result.pack("C*")
  end

  #Get the cypher (aka encrypted) output data set up.
  def setup_cypher_output
    @data = @offset = nil   # Just cleanup.
  end

end
