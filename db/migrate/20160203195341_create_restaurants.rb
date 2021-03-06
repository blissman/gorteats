class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.integer :price
      t.text :description
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
