class CreateSellerOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :seller_offers do |t|
      t.belongs_to :seller
      t.string :name
      t.string :currency
      t.string :url
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
