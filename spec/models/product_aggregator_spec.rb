require 'rails_helper'

RSpec.describe ProductAggregator, type: :model do
  let(:value) { 'Nintendo Switch' }
  let(:search_term) { SearchTerm.new(value) }
  let(:product_aggregator) { ProductAggregator.new(search_term) }

  context 'querying products endpoint' do
    it 'responds with results' do
      VCR.use_cassette('products_response') do
        product_aggregator.aggregate
        expect(product_aggregator.products).to_not be_empty
      end
    end

    it 'responds with a count' do
      VCR.use_cassette('products_response') do
        product_aggregator.aggregate
        expect(product_aggregator.products.size).to be > 0
      end
    end
  end
end
