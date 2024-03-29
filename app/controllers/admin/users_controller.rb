class Admin::UsersController < ApplicationController

  def index
    @vegetainable_reviews = VegetainableReview.all
    @users = User.all
    @user = @users.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @vegetainable_reviews = @user.vegetainable_reviews
    @vegetainable_review = @vegetainable_reviews.page(params[:page])
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to edit_admin_user_path(@user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.is_active = false if not params[:user][:is_active]
    user.update(user_params)
    redirect_to admin_users_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:admin_id, :email, :user_id, :nickname, :name, :encrypted_password, :image, :telephone_number, :is_active, tag_ids: [])
  end


end
