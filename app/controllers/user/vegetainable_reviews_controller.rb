class User::VegetainableReviewsController < ApplicationController

  def index
    @vegetainable_reviews = VegetainableReview.all
  end

  def show
    @vegetainable_review = VegetainableReview.find(params[:id])
  end

  def new
    @vegetainable_review = VegetainableReview.new
  end

  def create
    @vegetainable_review = VegetainableReview.new(vegetainable_review_params)
    @vegetainable_review.user_id = current_user.id
    @vegetainable_review.save
    redirect_to vegetainable_reviews_path
  end

  def edit
    @vegetainable_review = VegetainableReview.find(params[:id])
  end

  private

  def vegetainable_review_params
    params.require(:vegetainable_review).permit(:title, :name, :price, :amount, :farmer_name, :shop_name, :image, :caption)
  end

end
