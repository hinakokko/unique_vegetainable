class User::UsersController < ApplicationController

  def index
    @vegetainable_review = VegetainableReview.find(params[:id])
    @vegetainable_reviews = @user.vegetainable_review
  end

  def show
    @user = User.find(params[:id])
    @vegetainable_reviews = @user.vegetainable_reviews
    # @vegetainable_reviews = params[:tag_id].present? ? Tag.find(params[:tag_id]).user.vegetainable_reviews : VegetainableReview.find(params.id)
    @vegetainable_reviews = @vegetainable_reviews.page(params[:page])
    # @comment = Comment.new
    # @comments = Comments.find(params[:id])
    # @comment = @vegetainable_reviews.comment
  end

  def mypage
    @user = current_user
    @vegetainable_reviews = @user.vegetainable_reviews
    @vegetainable_reviews = @vegetainable_reviews.page(params[:page])
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
    user = current_user
    user.update(is_active: false)
    reset_session
    redirect_to new_user_session_path
  end

  private

  def user_params
    params.require(:user).permit(:admin_id, :email, :user_id, :nickname, :name, :encrypted_password, :profile_image, :telephone_number, :is_active, tag_ids: [])
  end

  def vegetainable_review_params
    params.require(:vegetainable_review).permit(:title, :name, :price, :amount, :farmer_name, :user_id, :shop_name, :image, :caption, :area, tag_ids: [])
  end

end