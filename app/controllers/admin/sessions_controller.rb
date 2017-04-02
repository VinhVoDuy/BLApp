class Admin::SessionsController < ApplicationController
  layout 'admin'
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(user_params[:email])
    return return_not_found unless @user

    if @user.valid_password?(user_params[:password]) && @user.is_admin
      sign_in @user
      redirect_to admin_room_types_path
    else
      return return_not_found
    end
  end

  def logout
    sign_out current_user if current_user
    redirect_to root_url
  end

  private
  def return_not_found
    flash.now[:danger] = 'Admin not found or incorrect password'
    @user = User.new(params[:email])
    render :new
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
