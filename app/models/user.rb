class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :vegetainable_reviews, dependent: :destroy
   has_many :favorites, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :favorites, dependent: :destroy
   belongs_to :admin, optional: true

   has_one_attached :profile_image

  def get_profile_image(width, height)
  if profile_image.blank?
    file_path = Rails.root.join('app/assets/images/716.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.guest
    find_or_create_by!(email: 'guest@vegetainable.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.telephone_number = "09000000000"
      user.name = "ゲストユーザー"
      user.nickname = "ゲストユーザー"
    end
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?","#{word}")
      @user += User.where("nickname LIKE?","#{word}")
      @user += User.where("id LIKE?","#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}")
      @user += User.where("nickname LIKE?","#{word}")
      @user += User.where("id LIKE?","#{word}")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","#{word}")
      @user += User.where("nickname LIKE?","#{word}")
      @user += User.where("id LIKE?","#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","#{word}")
      @user += User.where("nickname LIKE?","#{word}")
      @user += User.where("id LIKE?","#{word}")
    else
      @vegetainable_review = VegetainableReview.all
    end
  end

end
