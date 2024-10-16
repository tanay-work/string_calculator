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
    input.split(delimiter.to_s).map(&:to_i).sum
  end
end
