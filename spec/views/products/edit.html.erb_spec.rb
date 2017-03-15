require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "MyString",
      :image_url => "MyString",
      :manufacturer => "MyString",
      :model => "MyString",
      :term => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_image_url[name=?]", "product[image_url]"

      assert_select "input#product_manufacturer[name=?]", "product[manufacturer]"

      assert_select "input#product_model[name=?]", "product[model]"

      assert_select "input#product_term[name=?]", "product[term]"
    end
  end
end
