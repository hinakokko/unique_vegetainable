class User::UsersController < ApplicationController
  def show
    @user = current_user
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

end
