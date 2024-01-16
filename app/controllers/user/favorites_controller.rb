class User::FavoritesController < ApplicationController

  def create
    vegetainable_review = VegetainableReview.find(params[:vegetainable_review_id])
    favorite = current_user.favorites.new(vegetainable_review_id: vegetainable_review.id)
    favorite.save
    redirect_to vegetainable_reviews_path(vegetainable_review)
  end

  def destroy
    vegetainable_review = VegetainableReview.find(params[:vegetainable_review_id])
    favorite = current_user.favorites.find_by(vegetainable_review_id: vegetainable_review.id)
    favorite.destroy
    redirect_to vegetainable_reviews_path(vegetainable_review)
  end

end
