require 'rails_helper'

RSpec.describe SearchTermsController, type: :controller do
  describe '#new' do
    it 'initializes new search term' do
      get :new
      expect(response).to be_successful
    end
  end

  describe '#create' do
    let(:value) { 'Nintendo Switch' }

    it 'validates search term' do
      post :create, params: { search_term: { value: value } }
      expect(response).to redirect_to(products_path(name: value.downcase))
    end

    it 'invalidates search term' do
      post :create, params: { search_term: { value: '' } }
      expect(response).to_not redirect_to(products_path(name: value.downcase))
    end
  end
end
