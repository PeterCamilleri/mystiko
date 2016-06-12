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

  def test_input_processing
    mystiko = Mystiko.new

    args = { in_str: "ABC", key: "fubar" }
    mystiko.process_inputs(args)
    assert_equal([65, 66, 67], mystiko.input)
    assert_equal(16, mystiko.window)
    assert_equal(Mystiko::Generator, mystiko.generator.class)

    args = { in_file: "tests/input.txt", key: "fubar" }
    mystiko.process_inputs(args)
    assert_equal([65, 66, 67], mystiko.input)
    assert_equal(16, mystiko.window)
    assert_equal(Mystiko::Generator, mystiko.generator.class)

    args = { in_str: "ABC", key: "fubar", window: 24 }
    mystiko.process_inputs(args)
    assert_equal([65, 66, 67], mystiko.input)
    assert_equal(24, mystiko.window)
    assert_equal(Mystiko::Generator, mystiko.generator.class)

    args = { in_file: "tests/input.txt", key: "fubar", window: 24 }
    mystiko.process_inputs(args)
    assert_equal([65, 66, 67], mystiko.input)
    assert_equal(24, mystiko.window)
    assert_equal(Mystiko::Generator, mystiko.generator.class)

    args = { in_str: "ABC", generator: Random.new(42) }
    mystiko.process_inputs(args)
    assert_equal([65, 66, 67], mystiko.input)
    assert_equal(16, mystiko.window)
    assert_equal(Random, mystiko.generator.class)

    args = { in_file: "tests/input.txt", generator: Random.new(42) }
    mystiko.process_inputs(args)
    assert_equal([65, 66, 67], mystiko.input)
    assert_equal(16, mystiko.window)
    assert_equal(Random, mystiko.generator.class)

    args = { in_str: "ABC", generator: Random.new(42), window: 24 }
    mystiko.process_inputs(args)
    assert_equal([65, 66, 67], mystiko.input)
    assert_equal(24, mystiko.window)
    assert_equal(Random, mystiko.generator.class)

    args = { in_file: "tests/input.txt", generator: Random.new(42), window: 24 }
    mystiko.process_inputs(args)
    assert_equal([65, 66, 67], mystiko.input)
    assert_equal(24, mystiko.window)
    assert_equal(Random, mystiko.generator.class)

    args = { key: "fubar" }
    assert_raises { mystiko.process_inputs(args) }

    args = { generator: Random.new(42) }
    assert_raises { mystiko.process_inputs(args) }

    args = { in_str: "ABC" }
    assert_raises { mystiko.process_inputs(args) }
  end

end