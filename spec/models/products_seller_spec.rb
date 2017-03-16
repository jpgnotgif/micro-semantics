require 'rails_helper'

RSpec.describe ProductsSeller, type: :model do
  context 'associations' do
    it 'belongs_to product' do
      expect(ProductsSeller.reflect_on_association(:product).macro).to eq(:belongs_to)
    end

    it 'belongs_to seller' do
      expect(ProductsSeller.reflect_on_association(:seller).macro).to eq(:belongs_to)
    end
  end
end
