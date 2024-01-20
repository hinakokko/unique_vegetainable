class Admin::UsersController < ApplicationController

  def index
   @reviews = VegetainableReview.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.vegetainable_reviews
  end

  private

  def user_params
    params.require(:user).permit(:admin_id, :user_id, :nickname, :name, :encrypted_password, :image, :telephone_number, :is_active, tag_ids: [])
  end


end
