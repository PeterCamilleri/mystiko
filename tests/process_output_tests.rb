# coding: utf-8

require_relative '../lib/mystiko'
gem              'minitest'
require          'minitest/autorun'

#Test the monkey patches applied to the Object class.
class ProcessOutputsTester < Minitest::Test

  def test_getting_some_output
    mystiko = Mystiko.new

    mystiko.output = "ABC"
    args = {  }
    assert_equal("ABC", mystiko.process_outputs(args))
    assert_nil(mystiko.output)

    mystiko.output = "ABC"
    str = ""
    args = { out_str: str  }
    assert_equal("ABC", mystiko.process_outputs(args))
    assert_equal("ABC", str)
    assert_nil(mystiko.output)

    mystiko.output = "ABC"
    out_name = "tests/output.txt"
    args = { out_file: out_name }
    assert_equal("ABC", mystiko.process_outputs(args))
    assert(File.exist?(out_name))
    assert_nil(mystiko.output)
    assert_equal("ABC", IO.read(out_name))
    system("rm #{out_name}")
    refute(File.exist?(out_name))
  end

  def test_erasing_inputs
    mystiko = Mystiko.new

    mystiko.output = "ABC"
    args = { in_file: "tests/input.txt", key: "fubar", window: 24 }
    assert_equal("ABC", mystiko.process_outputs(args))
    assert_nil(mystiko.output)
    assert_nil(mystiko.input)
    assert_nil(mystiko.window)
    assert_nil(mystiko.generator)
  end

end
