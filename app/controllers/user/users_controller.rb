class User::UsersController < ApplicationController
  def index
    @vegetainable_review = VegetainableReview.find(params[:id])
  end

  def show
    # @user = User.find(params[:id])
    @vegetainable_review = VegetainableReview.find(params[:id])
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
  end

  private

  def user_params
    params.require(:vegetainable_review).permit(:nickname, :name, :email, :encrypted_password, :telephone_number, :is_active, :image)
  end

end
