# frozen_string_literal: true

# string_calculator_test.rb
require 'minitest/autorun'
require_relative 'string_calculator'

# Test cases for calculator class
class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_add_empty_string
    assert_equal 0, @calculator.add('')
  end

  def test_add_single_number
    assert_equal 1, @calculator.add('1')
  end

  def test_add_two_numbers
    assert_equal 3, @calculator.add('1,2')
  end

  def test_add_with_newlines
    assert_equal 15, @calculator.add("1\n\n\n\n\n2,3\n\n\n4,5\n")
  end

  def test_add_with_custom_delimiter
    assert_equal 15, @calculator.add("//;\n1;2;3;4;\n\n\n;0\n\n\n;5;0")
  end

  def test_add_with_negative_number
    assert_raises(RuntimeError, 'negative numbers not allowed -1') { @calculator.add('-1') }
  end

  def test_add_with_multiple_negative_numbers
    assert_raises(RuntimeError, 'negative numbers not allowed -1,-2') { @calculator.add('-1,-2') }
  end

  def test_add_ignores_numbers_bigger_than_1000
    assert_equal 2, @calculator.add('2,1001')
  end

  def test_add_with_custom_delimiter_and_bigger_numbers
    assert_equal 20, @calculator.add("//;\n1;2;3;4;\n\n\n;0\n\n\n;5;0;1002;9874;4444;5")
  end

  def test_add_with_delimiter_of_any_length
    assert_equal 6, @calculator.add("//[***]\n1***2***3")
  end

  def test_add_with_multiple_delimiters
    assert_equal 6, @calculator.add("//[*][%]\n1*2%3")
  end
end
