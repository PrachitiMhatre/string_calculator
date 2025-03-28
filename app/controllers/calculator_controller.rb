# app/controllers/calculator_controller.rb
class CalculatorController < ApplicationController
  def add
    numbers = params[:numbers]
    # If numbers is empty, set result to 0
    if numbers.blank?
      @result = 0
      @error_message = nil
    else
       # Check if the string starts with "//" indicating a custom delimiter
      if numbers.start_with?("//")
        # delimiter_line, numbers = numbers.scan(/^(\/\/.*)\n(.*)$/).flatten
        parts = numbers.split("\\n", 2)
        
        delimiter_line = parts[0]
        numbers = parts[1]
        
      # # Extract the custom delimiter (skip "//" from the delimiter line)
        delimiter = delimiter_line[2..-1]  # Extract the custom delimiter after "//"

      # Replace all newlines with the custom delimiter
        numbers = numbers.gsub("\n", delimiter) 
         # Replace newline between the numbers with the delimiter
      else
        delimiter = ','  # Default delimiter is a comma
      end
       numbers.split(delimiter).map(&:to_i).sum
      number_array = numbers.split(delimiter)
      # Convert strings to integers and check for negative numbers
      negatives = []
      @result = number_array.reduce(0) do |total, num|
        num = num.to_i
        negatives << num if num < 0
        total + num
      end
      # If there are negative numbers, raise an exception
      if negatives.any?
        @error_message = "Negative numbers not allowed: #{negatives.join(', ')}"
        @result = nil
      else
        @error_message = nil
      end
    end
  end
end
