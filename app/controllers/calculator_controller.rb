# app/controllers/calculator_controller.rb
class CalculatorController < ApplicationController
  def add
    numbers = params[:numbers]

    if numbers.blank?
      @result = 0
      @error_message = nil
    else
      if numbers.start_with?("//")
        parts = numbers.split("\\n", 2)
        
        delimiter_line = parts[0]
        numbers = parts[1]
        
        delimiter = delimiter_line[2..-1]

        numbers = numbers.gsub("\n", delimiter) 
      else
        delimiter = ','
      end
      numbers.split(delimiter).map(&:to_i).sum
      number_array = numbers.split(delimiter)

      @negatives = []
      @result = negative_number(number_array)

      if @negatives.any?
        @error_message = "Negative numbers not allowed: #{@negatives.join(', ')}"
        @result = nil
      else
        @error_message = nil
      end
    end
  end

  private

  def negative_number(number_array)
    number_array.reduce(0) do |total, num|
      num = num.to_i
      @negatives << num if num < 0
      total + num
    end
  end
end
