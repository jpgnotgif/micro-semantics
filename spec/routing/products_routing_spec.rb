require "rails_helper"

RSpec.describe ProductsController, type: :routing do
  describe "routing" do
    let(:name) { 'ipad' }

    it "routes to #index" do
      expect(get: "/products?name=#{name}").to route_to(
        controller: 'products',
        action: 'index',
        name: name
      )
    end

    it "routes to #show" do
      expect(get: "/products/1").to route_to(
        controller: 'products',
        action: 'show',
        id: '1'
      )
    end
  end
end
