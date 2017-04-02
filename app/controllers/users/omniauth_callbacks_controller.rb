class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for 'facebook'
    # You need to implement the method below in your model (e.g. app/models/user.rb)
  end

  def google_oauth2
    callback_for 'google'
  end

  def twitter
    callback_for 'twitter'
  end

  def callback_for service
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => service) if is_navigational_format?
    else
      session["devise.#{service}_data"] = request.env["omniauth.auth"].except('extra')
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end
end
