class Admin::VegetainableReviewsController < ApplicationController

  def index
    @vegetainable_reviews = VegetainableReview.all
  end

  def show
    # @user = User.find(params[:user_id])
    @vegetainable_review = VegetainableReview.find(params[:id])
    @user = @vegetainable_review.user
    if @vegetainable_review.nil?
      redirect_to admin_users_path
    end
    # @user_id = @user.vegetainable_reviews
    # redirect_to admin_user_vegetainable_review_path(@user)
  end

  def destroy
    @vegetainable_review = VegetainableReview.find(params[:id])
    @vegetainable_review.destroy
    user = User.find(params[:user_id])
    redirect_to admin_user_path(user.id), notice: '★ レビューが１件削除されました！'
  end


end
