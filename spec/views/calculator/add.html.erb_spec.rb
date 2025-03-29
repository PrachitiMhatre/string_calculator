require 'rails_helper'

RSpec.describe 'calculator/add.html.erb', type: :view do
  let(:valid_numbers) { '1,2,3' }
  let(:error_message) { 'Negative numbers not allowed: -1' }

  context 'when displaying the form' do
    it 'renders the form correctly' do
      assign(:result, nil)
      assign(:error_message, nil)

      render

      expect(rendered).to have_selector('form')
      expect(rendered).to have_selector('input[type="text"]')
      expect(rendered).to have_selector('input[type="submit"]')
      expect(rendered).to match(/Enter numbers/)
    end
  end

  context 'when displaying the result' do
    it 'renders the result correctly when @result is present' do
      assign(:result, 6)
      assign(:error_message, nil)

      render
      expect(rendered).to have_selector('h6', text: 'Result: 6')
    end
  end

  context 'when displaying an error message' do
    it 'shows the error message when @error_message is present' do
      assign(:result, nil)
      assign(:error_message, error_message)

      render

      expect(rendered).to have_selector('h6', text: 'Error: Negative numbers not allowed: -1')
    end
  end
end
