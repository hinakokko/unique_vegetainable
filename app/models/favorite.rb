class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :vegetainable_review

  validates :user_id, uniqueness: {scope: :vegetainable_review_id}

end
