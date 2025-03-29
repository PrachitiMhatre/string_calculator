## String Calculator App

A simple full-stack Rails application that allows users to perform basic calculations with strings of numbers. The app parses strings containing numbers separated by commas and returns the sum of those numbers. It includes features like input validation and error handling for invalid inputs.

## Features

- **Add Numbers:** Users can input a string of comma-separated numbers, and the app will return the sum.
- **Supports Empty Strings:** An empty string returns a sum of `0`.

## Requirements

- Ruby 3.0.0
- Rails 7.1.5.1

## Installation

Follow these steps to get the app running locally.
### 1. Clone the Repository

`git clone https://github.com/PrachitiMhatre/string_calculator.git`
`cd string_calculator`


### 2. Install Dependencies

Make sure you have Ruby and Rails installed on your machine. Then, install the required gems:

`bundle install`

### 3. Run the Application

Start the Rails server:

`rails s`

By default, the app will be accessible at http://localhost:3000.

### 4. Access the Application

Open your browser and go to http://localhost:3000.

## Usage
Basic String Calculation

Enter a string of comma-separated numbers and click "Calculate" to get the sum.

Example:

    Input: 1,2,3

    Output: 6

Empty String

An empty string returns 0:

    Input: ""

    Output: 0

## Testing

Run the test suite with RSpec:

`bundle exec rspec`




