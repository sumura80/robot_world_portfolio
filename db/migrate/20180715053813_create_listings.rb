class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.string :power
      t.string :product_no
      t.string :price

      t.timestamps
    end
  end
end
