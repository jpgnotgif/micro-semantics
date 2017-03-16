class CreateSellers < ActiveRecord::Migration[5.0]
  def change
    create_table :sellers do |t|
      t.string :name
      t.timestamps
    end
    add_index :sellers, :name
  end
end
