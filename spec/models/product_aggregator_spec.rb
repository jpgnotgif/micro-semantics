require 'rails_helper'

RSpec.describe ProductAggregator, type: :model do
  let(:value) { 'Nintendo Switch' }
  let(:search_term) { SearchTerm.new(value) }
  let(:product_aggregator) { ProductAggregator.new(search_term) }

  context 'querying products endpoint' do
    it 'responds with results' do
      VCR.use_cassette('products_response', record: :new_episodes) do
        product_aggregator.aggregate
        expect(product_aggregator.products).to_not be_empty
      end
    end

    it 'responds with a count' do
      VCR.use_cassette('products_response', record: :new_episodes) do
        product_aggregator.aggregate
        expect(product_aggregator.products.size).to be > 0
      end
    end

    it 'creates products' do
      VCR.use_cassette('products_response', record: :new_episodes) do
        product_aggregator.aggregate
        expect(Product.count).to eq(product_aggregator.products.size)
      end
    end

    it 'creates sellers' do
      VCR.use_cassette('products_response', record: :new_episodes) do
        product_aggregator.aggregate
        expect(Seller.count).to be > 0
      end
    end

    it 'creates seller offers' do
      VCR.use_cassette('products_response', record: :new_episodes) do
        product_aggregator.aggregate
        expect(SellerOffer.count).to be > 0
      end
    end

    it 'will not create sellers when a product cannot be created' do
      VCR.use_cassette('products_response', record: :new_episodes) do
        allow(Product).to receive(:create!).and_raise(Exception)
        product_aggregator.aggregate
        expect(Seller.count).to eq 0
      end
    end

    it 'will not create seller offers when a product cannot be created' do
      VCR.use_cassette('products_response', record: :new_episodes) do
        allow(Product).to receive(:create!).and_raise(Exception)
        product_aggregator.aggregate
        expect(SellerOffer.count).to eq 0
      end
    end
  end

  context 'when products exist in table' do
    it 'does not query products endpoint' do
      product = create(:product)
      search_term = SearchTerm.new(product.term)
      aggregator = ProductAggregator.new(search_term)

      expect_any_instance_of(Semantics3::Products).to_not receive(:get_products)
      aggregator.aggregate
    end
  end
end
