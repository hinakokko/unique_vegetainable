# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController

  before_action :user_state, only: [:create]

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: '★ゲストユーザーとしてログインしました！'
  end

#   def destroy
#   byebug
#   session[:user_id] = nil
#   redirect_to root_path, notice: 'ログアウトしました'
# 　end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def user_state
    @user = User.find_by(email: params[:user][:email])
    return if !@user
    if @user.valid_password?(params[:user][:password]) && !@user.is_active
      redirect_to new_user_registration_path
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email, :encrypted_password])
  end

  private

def user_state
    @user = User.find_by(email: params[:user][:email])
    return if !@user
    if @user.valid_password?(params[:user][:password]) && !@user.is_active
      redirect_to new_user_registration_path
    end
end


end
