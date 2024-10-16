# frozen_string_literal: true

# calculator class which takes string as a input
class StringCalculator
  def add(input)
    return 0 if input.empty?

    numbers_array = input.split(',').map(&:to_i)
    numbers_array.sum
  end
end
