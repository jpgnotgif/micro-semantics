class Seller < ApplicationRecord
  has_many :products_seller
  has_many :products, through: :product_sellers

  has_many :offers, class_name: SellerOffer
end
