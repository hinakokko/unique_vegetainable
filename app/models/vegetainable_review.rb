class VegetainableReview < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :vegetainable_reviews_tags, dependent: :destroy
  has_many :tags, through: :vegetainable_reviews_tags

  validates :title, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :amount, presence: true
  validates :caption, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_image
    unless image.attached?(width, height)
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
