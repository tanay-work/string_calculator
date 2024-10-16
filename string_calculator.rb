# frozen_string_literal: true

# calculator class which takes string as a input
class StringCalculator
  def add(input)
    return 0 if input.empty?

    # delimiter condition
    if input.start_with?("//")
      delimiter = input[2]
      input = input[4..-1]
      input = input.gsub(delimiter, ",")
    end

    input = input.gsub("\n", ",")
    input.split(',').map(&:to_i).sum
  end
end
