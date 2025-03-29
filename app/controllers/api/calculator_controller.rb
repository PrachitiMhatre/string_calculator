class Api::CalculatorController < ApplicationController
  def add
    return render plain: '0' if params[:numbers].blank?

    numbers = params[:numbers]
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

    @sum = negative_numbers(number_array)

    if @negatives.any?
      return render plain: "negative numbers not allowed #{@negatives.join(', ')}"
    end

    render json: @sum
  end

  private 

  def negative_numbers(number_array)
    number_array.reduce(0) do |total, num|
      num = num.to_i
      @negatives << num if num < 0
      total + num
    end
  end
end
