class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :vegetainable_reviews

  validates :user_id, uniqueness: {scope: :vegetainable_review_id}

end
