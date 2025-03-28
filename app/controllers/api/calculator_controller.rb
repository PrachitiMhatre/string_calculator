class Api::CalculatorController < ApplicationController
  def add
    return render plain: '0' if params[:numbers].blank?
    # Handle custom delimiter
    if params[:numbers].start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)
      delimiter = delimiter_line[2..-1] # Extract the custom delimiter
      numbers = numbers.gsub("\n", delimiter) # Replace newlines with the custom delimiter
    else
      delimiter = ',' # Default delimiter
    end
    # Split numbers by the delimiter
    number_array = params[:numbers].split(delimiter)
    # Convert strings to integers and check for negative numbers
    negatives = []
    sum = number_array.reduce(0) do |total, num|
      num = num.to_i
      negatives << num if num < 0
      total + num
    end
    # If there are negative numbers, raise an exception
    if negatives.any?
      return render plain: "negative numbers not allowed #{negatives.join(', ')}"
    end
    render json: sum
  end
end
