# frozen_string_literal: true

# calculator class which takes string as a input
class StringCalculator
  def add(input)
    return 0 if input.empty?

    current_delimiter = delimiter(input)

    input = input.gsub(%r{//[^\n]+\n}, '')
    input.gsub!("\n", current_delimiter)
    numbers = input.split(current_delimiter.to_s).map(&:to_i)

    negative_numbers = numbers.select(&:negative?)
    raise "negative numbers not allowed #{negative_numbers.join(',')}" if negative_numbers.any?

    numbers.select { |number| number <= 1000 }.sum # ignore numbers > 1000
  end

  private

  def delimiter(input)
    if input.start_with?('//')
      if input.match?(%r{//\[(.*?)\]\n}) # Check if delimiter is in brackets
        input.match(%r{//\[(.*?)\]\n})[1]
      else
        input.match(%r{//(.)\n})[1] # Extract single-character delimiter
      end
    else
      ',' # default delimiter
    end
  end
end
