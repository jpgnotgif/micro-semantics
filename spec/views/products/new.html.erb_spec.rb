require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :name => "MyString",
      :image_url => "MyString",
      :manufacturer => "MyString",
      :model => "MyString",
      :term => "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_image_url[name=?]", "product[image_url]"

      assert_select "input#product_manufacturer[name=?]", "product[manufacturer]"

      assert_select "input#product_model[name=?]", "product[model]"

      assert_select "input#product_term[name=?]", "product[term]"
    end
  end
end
