class CreateProductsSellers < ActiveRecord::Migration[5.0]
  def change
    create_join_table :products, :sellers do |t|
      t.index :product_id
      t.index :seller_id

      t.timestamps
    end
  end
end
