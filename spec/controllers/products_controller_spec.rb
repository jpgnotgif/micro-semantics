require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    it 'shows products' do
      get :index, params: { name: 'ipad' }
      expect(response).to be_successful
    end

    it 'redirects if search term is not present' do
      get :index
      expect(response).to redirect_to('/')
    end
  end
end
