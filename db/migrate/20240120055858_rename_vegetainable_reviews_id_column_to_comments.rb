class RenameVegetainableReviewsIdColumnToComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :vegetainable_reviews_id, :vegetainable_review_id
  end
end
