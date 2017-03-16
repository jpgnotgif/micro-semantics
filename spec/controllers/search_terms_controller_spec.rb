require 'rails_helper'

RSpec.describe SearchTermsController, type: :controller do
  describe '#new' do
    let(:value) { 'Nintendo Switch' }

    it 'initializes new search term' do
      get :new
      expect(response).to be_successful
    end

    it 'validates search term' do
      post :create, params: { search_term: { value: value } }
      expect(response).to redirect_to(products_path(value.downcase))
    end
  end
end
