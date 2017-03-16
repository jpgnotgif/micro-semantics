require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'associations' do
    it 'has_many products_seller' do
      expect(Product.reflect_on_association(:products_seller).macro).to eq(:has_many)
    end

    it 'has_many sellers' do
      expect(Product.reflect_on_association(:sellers).macro).to eq(:has_many)
    end

    it 'has_many sellers through products_seller' do
      expect(Product.reflect_on_association(:sellers).options[:through]).to eq(:products_seller)
    end
  end
end
