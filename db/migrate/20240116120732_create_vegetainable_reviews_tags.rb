class CreateVegetainableReviewsTags < ActiveRecord::Migration[6.1]
  def change
    create_table :vegetainable_reviews_tags do |t|
      t.references :vegetainable_review, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
