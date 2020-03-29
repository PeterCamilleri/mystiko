# coding: utf-8

require_relative '../lib/mystiko'
gem              'minitest'
require          'minitest/autorun'

#Test the monkey patches applied to the Object class.
class ProcessInputsTester < Minitest::Test

  def test_in_str_arg
    mystiko = Mystiko.new

    args = { in_str: "ABC", key: "fubar" }
    mystiko.process_inputs(args)
    assert_equal("ABC", mystiko.input)
    assert_equal(16, mystiko.window)
    assert_equal(Mystiko::Generator, mystiko.generator.class)

    args = { in_file: "tests/input.txt", key: "fubar" }
    mystiko.process_inputs(args)
    assert_equal("ABC", mystiko.input)
    assert_equal(16, mystiko.window)
    assert_equal(Mystiko::Generator, mystiko.generator.class)

    args = { in_str: "ABC", key: "fubar", window: 24 }
    mystiko.process_inputs(args)
    assert_equal("ABC", mystiko.input)
    assert_equal(24, mystiko.window)
    assert_equal(Mystiko::Generator, mystiko.generator.class)
  end

  def test_in_file_processing
    mystiko = Mystiko.new

    args = { in_file: "tests/input.txt", key: "fubar", window: 24 }
    mystiko.process_inputs(args)
    assert_equal("ABC", mystiko.input)
    assert_equal(24, mystiko.window)
    assert_equal(Mystiko::Generator, mystiko.generator.class)

    args = { in_str: "ABC", generator: Random.new(42) }
    mystiko.process_inputs(args)
    assert_equal("ABC", mystiko.input)
    assert_equal(16, mystiko.window)
    assert_equal(Random, mystiko.generator.class)

    args = { in_file: "tests/input.txt", generator: Random.new(42) }
    mystiko.process_inputs(args)
    assert_equal("ABC", mystiko.input)
    assert_equal(16, mystiko.window)
    assert_equal(Random, mystiko.generator.class)
  end

  def test_generator_processing
    mystiko = Mystiko.new

    args = { in_str: "ABC", generator: Random.new(42), window: 24 }
    mystiko.process_inputs(args)
    assert_equal("ABC", mystiko.input)
    assert_equal(24, mystiko.window)
    assert_equal(Random, mystiko.generator.class)

    args = { in_file: "tests/input.txt", generator: Random.new(42), window: 24 }
    mystiko.process_inputs(args)
    assert_equal("ABC", mystiko.input)
    assert_equal(24, mystiko.window)
    assert_equal(Random, mystiko.generator.class)
  end

  def test_missing_input_processing
    mystiko = Mystiko.new

    args = { key: "fubar" }
    assert_raises { mystiko.process_inputs(args) }

    args = { generator: Random.new(42) }
    assert_raises { mystiko.process_inputs(args) }

    args = { in_str: "ABC" }
    assert_raises { mystiko.process_inputs(args) }
  end

end
