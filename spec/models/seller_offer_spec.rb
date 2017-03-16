require 'rails_helper'

RSpec.describe SellerOffer, type: :model do
  context 'associations' do
    it 'belongs_to seller' do
      expect(SellerOffer.reflect_on_association(:seller).macro).to eq(:belongs_to)
    end
  end
end
