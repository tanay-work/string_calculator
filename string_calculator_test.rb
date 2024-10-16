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
    assert_equal 6, @calculator.add("1\n2,3")
  end
end
