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

  def get_image(width, height)
    if image.attached?
      image.variant(resize_to_limit: [width, height])
    else
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @vegetainable_review = VegetainableReview.where("shop_name LIKE?","#{word}")
      @vegetainable_review += VegetainableReview.where("farmer_name LIKE?","#{word}")
      @vegetainable_review += VegetainableReview.where("area LIKE?","#{word}")
      @vegetainable_review += VegetainableReview.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @vegetainable_review = VegetainableReview.where("shop_name LIKE?","#{word}%")
      @vegetainable_review += VegetainableReview.where("farmer_name LIKE?","#{word}")
      @vegetainable_review += VegetainableReview.where("area LIKE?","#{word}")
      @vegetainable_review += VegetainableReview.where("name LIKE?","#{word}")
    elsif search == "backward_match"
      @vegetainable_review = VegetainableReview.where("shop_name LIKE?","%#{word}")
      @vegetainable_review += VegetainableReview.where("farmer_name LIKE?","#{word}")
      @vegetainable_review += VegetainableReview.where("area LIKE?","#{word}")
      @vegetainable_review += VegetainableReview.where("name LIKE?","#{word}")
    elsif search == "partial_match"
      @vegetainable_review = VegetainableReview.where("shop_name LIKE?","%#{word}%")
      @vegetainable_review += VegetainableReview.where("farmer_name LIKE?","#{word}")
      @vegetainable_review += VegetainableReview.where("area LIKE?","#{word}")
      @vegetainable_review += VegetainableReview.where("name LIKE?","#{word}")
    else
      @vegetainable_review = VegetainableReview.all
    end
  end

  # def self.looks(search, word)
  #   if search == 'word'
  #     where("shop_name LIKE ?", "%#{word}%")
  #   elsif search == 'word'
  #     where("farmer_name LIKE ?", "%#{word}%")
  #   else
  #     all
  #   end
  # end

end
