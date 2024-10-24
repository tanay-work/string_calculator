# frozen_string_literal: true

# calculator class which takes string as a input
class StringCalculator
  def add(input)
    return 0 if input.empty?

    current_delimiters = delimiters(input)

    # Remove the custom delimiter declaration from the input
    input = input.gsub(%r{//[^\n]+\n}, '')

    # Replace newlines with the first delimiter
    input.gsub!("\n", current_delimiters.first)

    # Split using all delimiters
    numbers = input.split(Regexp.union(current_delimiters)).map(&:to_i)

    # Check for negative numbers
    negative_numbers = numbers.select(&:negative?)
    raise "negative numbers not allowed #{negative_numbers.join(',')}" if negative_numbers.any?

    # Ignore numbers > 1000
    numbers.select { |number| number <= 1000 }.reduce(current_delimiters.first == '*' ? :* : :+)
  end

  private

  def delimiters(input)
    if input.start_with?('//')
      # Check for multiple delimiters enclosed in brackets
      if input.match?(%r{//\[(.*?)\]\n})
        input.scan(%r{\[(.*?)\]}).flatten # Extract all delimiters
      else
        [input.match(%r{//(.)\n})[1]] # Single character delimiter
      end
    else
      [','] # Default delimiter
    end
  end

end
