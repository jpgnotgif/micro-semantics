require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :name => "Name",
        :image_url => "Image Url",
        :manufacturer => "Manufacturer",
        :model => "Model",
        :term => "Term"
      ),
      Product.create!(
        :name => "Name",
        :image_url => "Image Url",
        :manufacturer => "Manufacturer",
        :model => "Model",
        :term => "Term"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => "Manufacturer".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "Term".to_s, :count => 2
  end
end
