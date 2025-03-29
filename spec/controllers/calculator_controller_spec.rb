require 'rails_helper'

RSpec.describe CalculatorController, type: :controller do

  describe "GET #add" do
    it "returns 0 for passing empty string" do
      get :add, params: { numbers: '' }
      expect(assigns(:result)).to eq(0)
    end

    it "does not return emtpy when passing empty string" do
      get :add, params: { numbers: '' }
      expect(assigns(:result)).not_to eq('')
    end

    it "returns sum of numbers provided by comma seperated string" do
      get :add, params: { numbers: '1,2,3' }
      expect(assigns(:result)).to eq(6)
    end

    it "returns sum of numbers provided by comma seperated string with \n" do
      get :add, params: { numbers: '1,2\n,3, 4,5   \n' }
      expect(assigns(:result)).to eq(15)
    end

    it "returns a message if negative number is provided" do
      get :add, params: { numbers: '1,2,-3,6' }
      expect(assigns(:error_message)).to eq('Negative numbers not allowed: -3')
    end

    it "returns a message if negative number is provided" do
      get :add, params: { numbers: '1,2,-3,6' }
      expect(assigns(:error_message)).to eq('Negative numbers not allowed: -3')
    end

    it "returns sum of numbers seperated by delimiters" do
      get :add, params: { numbers: '//;\n1;2' }
      expect(assigns(:result)).to eq(3)
    end
  end
end
