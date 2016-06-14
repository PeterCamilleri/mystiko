# coding: utf-8

require_relative '../lib/mystiko'
gem              'minitest'
require          'minitest/autorun'
require          'minitest_visible'

#Test the monkey patches applied to the Object class.
class MystikoTester < Minitest::Test

  #Track mini-test progress.
  include MinitestVisible

  def test_for_existence
    assert_equal(Class, Mystiko.class)
  end

  def test_for_filler_bytes
    assert_equal(Fixnum, Mystiko.new.filler_byte.class)
  end

  def test_for_gnerated_bytes
    assert_equal(Fixnum, Mystiko::Generator.new("foo").rand(256).class)
  end

  def test_some_encryption
    result = Mystiko.new.encrypt(in_str: "ABC", key: "123", filler: 0).bytes
    expected = [107, 156, 100,  81,  10,  28, 141,
                 21, 124, 206, 247,  57, 162,  99,
                 13, 145, 184,  17,   8,  25]

    assert_equal(expected, result)
  end

  def test_some_decryption
    plain     = "ABCDEFG Eric the half a bee."
    cypher    = Mystiko.new.encrypt(in_str: plain,  key: "123")
    recovered = Mystiko.new.decrypt(in_str: cypher, key: "123")
    assert_equal(plain, recovered)
  end

end
