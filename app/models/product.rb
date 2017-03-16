class Product < ApplicationRecord
  has_many :products_seller
  has_many :sellers, through: :products_seller
end
