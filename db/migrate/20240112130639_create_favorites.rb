class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|

      t.string :user_id, null: false
      t.string :vegetainable_review_id, null: false

      t.timestamps
    end
  end
end
