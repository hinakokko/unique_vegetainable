class CreateVegetainableReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :vegetainable_reviews do |t|

      t.integer :user_id, null: false
      t.string :name, null: false
      t.integer :price
      t.string :farmer_name
      t.string :shop_name
      t.text :caption, null: false
      t.string :title, null: false
      t.integer :amount
      t.string :area

      t.timestamps
    end
  end
end
