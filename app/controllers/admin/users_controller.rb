class Admin::UsersController < ApplicationController

  def index
   @reviews = VegetainableReview.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.vegetainable_reviews
  end
end
