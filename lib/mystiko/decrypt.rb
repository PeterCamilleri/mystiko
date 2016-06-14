# coding: utf-8

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

  end

  #Do the actual decryption work.
  def do_decryption

  end

  #Get the clear (aka unencrypted) output data set up.
  def setup_clear_output

  end

end
