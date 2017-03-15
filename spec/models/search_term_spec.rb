require 'rails_helper'

RSpec.describe SearchTerm, type: :model do
  let(:value) { 'Nintendo Switch' }
  subject(:search_term) { SearchTerm.new(value) }

  it 'initializes' do
    expect(search_term.value).to eq(value.downcase)
  end

  it 'validates value' do
    search_term = SearchTerm.new
    search_term.valid?
    expect(search_term.errors[:value]).to_not be_empty
  end
end
