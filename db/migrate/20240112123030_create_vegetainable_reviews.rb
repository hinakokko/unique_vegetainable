class CreateVegetainableReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :vegetainable_reviews do |t|

      t.integer :user_id, null: false
      t.string :name, null: false
      t.integer :price, null: false
      t.string :farmer_name, null: false
      t.string :shop_name, null: false

      t.timestamps
    end
  end
end
