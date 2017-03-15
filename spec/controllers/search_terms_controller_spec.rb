require 'rails_helper'

RSpec.describe SearchTermsController, type: :controller do
  describe '#new' do
    let(:value) { 'Nintendo Switch' }

    it 'initializes new search term' do
      get :new
      expect(response).to be_successful
    end

    it 'validates search term' do
      params = {
        value: value
      }
      post :create, params
      expect(response).to redirect_to(products_path)
    end
  end
end
