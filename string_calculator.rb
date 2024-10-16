# frozen_string_literal: true

# calculator class which takes string as a input
class StringCalculator
  def add(input)
    return 0 if input.empty?

    delimiter = ',' # set default delimiter

    # delimiter condition
    if input.start_with?('//')
      delimiter = input.match(%r{//(.)\n})[1] # extract custom delimiter from the input
    end

    input = input.gsub(%r{//[^\n]+\n}, '')
    input.gsub!("\n", delimiter)
    numbers = input.split(delimiter.to_s).map(&:to_i)

    negative_numbers = numbers.select(&:negative?)
    raise "negative numbers not allowed #{negative_numbers.join(',')}" if negative_numbers.any?

    numbers.select { |number| number <= 1000 }.sum # ignore numbers > 1000
  end
end
