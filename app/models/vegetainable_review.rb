class VegetainableReview < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :vegetainable_reviews_tags, dependent: :destroy
  has_many :tags, through: :vegetainable_reviews_tags

end
