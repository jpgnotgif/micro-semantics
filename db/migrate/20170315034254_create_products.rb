class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image_url
      t.string :manufacturer
      t.string :model
      t.string :term

      t.timestamps
    end

    add_index :products, :term
  end
end
