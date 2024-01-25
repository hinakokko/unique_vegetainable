class User::UsersController < ApplicationController

  def index
    @vegetainable_review = VegetainableReview.find(params.id)
    @vegetainable_reviews = @user.vegetainable_review
  end

  def show
    @user = User.find(params[:id])
    @vegetainable_reviews = @user.vegetainable_reviews
  end

  def mypage
    @user = current_user
    @vegetainable_reviews = @user.vegetainable_reviews
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to my_page_path(user)
  end

  def withdraw_confirmation
  end

  def withdraw
  end

  private

  def user_params
    params.require(:user).permit(:admin_id, :email, :user_id, :nickname, :name, :encrypted_password, :profile_image, :telephone_number, :is_active, tag_ids: [])
  end

  def vegetainable_review_params
    params.require(:vegetainable_review).permit(:title, :name, :price, :amount, :farmer_name, :user_id, :shop_name, :image, :caption, :area, tag_ids: [])
  end

end