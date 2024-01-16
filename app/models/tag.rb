class Tag < ApplicationRecord

  has_many :vegetainable_reviews_tags, dependent: :destroy
  has_many :vegetainable_reviews, through: :vegetainable_reviews_tags

  validates :name, presence: true
  validates :name, uniqueness: true

end
