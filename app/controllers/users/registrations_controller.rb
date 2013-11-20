class Users::RegistrationsController < Devise::RegistrationsController
  def sign_up_params
  	params.require(:user).permit(:email, :password, :password_confirmation).merge(:dropbox_token => session[:token], :dropbox_secret => session[:secret])
	end
end
