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
    assert_equal(Module, Mystiko.class)
  end

  def test_for_filler_bytes
    assert_equal(Fixnum, Mystiko.filler_byte.class)
  end


end