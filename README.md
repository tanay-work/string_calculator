# String Calculator

A Ruby project which implements a string calculator with the following features:

* Accepts a string of comma-separated numbers as input.
* Return the sum of input numbers as an integer.
* Accept new lines between numbers.
* Accept custom delimiters specified at start of the string.
* Throws an exception for negative numbers.
* Number bigger than 1000 are skipped.
* Handle multiple delimiters of any length


## Installation and Usage

  **Clone the Repository using HTTP or SSH**
  
  HTTP
  ```bash
    git clone https://github.com/tanay-work/string_calculator.git
  ```

  SSH
  ```bash
   git clone git@github.com:tanay-work/string_calculator.git
  ```

### Usage

To use the calculator, Open Terminal go to the project directory and open irb console by using below command (which include the file directly)
  ```bash
    irb -r ./string_calculator.rb
  ```

#### Create an instance
```ruby
cal = StringCalculator.new
```  

Add Multiple numbers with comman
```ruby
result = cal.add("1,2,3")
puts result  # Output: 6
```

Handle multiple new lines
```ruby
result = cal.add("1\n2,3")
puts result # Output: 6
```

```ruby
result = cal.add("1\n\n\n\n\n2,3\n\n\n4,5\n")
puts result  # Output: 15
```

Handle Custom delimiter
```ruby
result = cal.add("//;\n1;2;3;4;\n\n\n;0\n\n\n;5;0")
puts result # Output: 15
```

Handle Negative numbers
```ruby
cal.add('-1')
# Output: negative numbers not allowed -1
```

```ruby
cal.add('-1,-2')
# Output: negative numbers not allowed -1,-2
```

Number bigger than 1000 are skipped
```ruby
result = cal.add('2,1001')
puts result # Output: 2
```

```ruby
result = cal.add("//;\n1;2;3;4;\n\n\n;0\n\n\n;5;0;1002;9874;4444;5")
puts result # Output: 20
```

Handle delimiter of any length
```ruby
result = cal.add("//[***]\n1***2***3")
puts result # Output: 6
```

Handle multiple delimiters
```ruby
result = cal.add("//[***][%%]\n1***2%%3")
puts result # Output: 6
```

Handle multiple delimiters of any length
```ruby
result = cal.add("//[***][%%]\n1***2%%3")
puts result # Output: 6
```

```ruby
result = cal.add("//[##][!!]\n1##2!!3\n4")
puts result # Output: 10
```
