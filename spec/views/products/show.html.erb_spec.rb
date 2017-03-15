require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "Name",
      :image_url => "Image Url",
      :manufacturer => "Manufacturer",
      :model => "Model",
      :term => "Term"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Image Url/)
    expect(rendered).to match(/Manufacturer/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Term/)
  end
end
