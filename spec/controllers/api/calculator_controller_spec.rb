require 'rails_helper'

RSpec.describe Api::CalculatorController, type: :controller do
  describe 'POST #add' do
    context 'when the numbers parameter is blank' do
      it 'returns 0' do
        get :add, params: { numbers: '' }
        expect(response.body).to eq('0')
      end
    end

    context 'when the numbers parameter is valid with a comma delimiter' do
      it 'returns the sum of the numbers' do
        get :add, params: { numbers: '1,2,3' }
        expect(response.body).to eq('6')
      end
    end

    context 'when the numbers parameter has a custom delimiter' do
      it 'returns the sum of the numbers using the custom delimiter' do
        get :add, params: { numbers: '//;\n1;2;3' }
        expect(response.body).to eq('6')
      end
    end

    context 'when the numbers parameter contains negative numbers' do
      it 'returns an error message with the negative numbers' do
        get :add, params: { numbers: '1,-2,3,-4' }
        expect(response.body).to eq('negative numbers not allowed -2, -4')
      end
    end

    context 'when the numbers parameter contains mixed valid and negative numbers' do
      it 'returns an error message with the negative numbers' do
        get :add, params: { numbers: '5,-1,7,-3' }
        expect(response.body).to eq('negative numbers not allowed -1, -3')
      end
    end
  end
end
