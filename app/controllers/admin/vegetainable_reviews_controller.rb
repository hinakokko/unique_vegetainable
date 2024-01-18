class Admin::VegetainableReviewsController < ApplicationController

  def index
    @vegetainable_reviews = VegetainableReview.all
  end

  def show
    @user = User.find(params[:user_id])
    @vegetainable_review = @user.vegetainable_reviews.find(params[:id])
  end

end
