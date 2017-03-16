require 'rails_helper'

RSpec.describe Seller, type: :model do
  context 'associations' do
    it 'has_many products_seller' do
      expect(Seller.reflect_on_association(:products_seller).macro).to eq(:has_many)
    end

    it 'has_many products' do
      expect(Seller.reflect_on_association(:products).macro).to eq(:has_many)
    end

    it 'has_many products through products_sellers' do
      expect(Seller.reflect_on_association(:products).options[:through]).to eq(:product_sellers)
    end

    it 'has_many offers' do
      expect(Seller.reflect_on_association(:offers).macro).to eq(:has_many)
    end
  end
end
