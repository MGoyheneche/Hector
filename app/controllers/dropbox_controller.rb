class DropboxController < ApplicationController
def authorize
    consumer = Dropbox::API::OAuth.consumer(:authorize)
    request_token = consumer.get_request_token
    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret
    redirect_to request_token.authorize_url(:oauth_callback => 'http://localhost:3000/dropbox/authorized_callback')
  end

  def authorized_callback
    consumer = Dropbox::API::OAuth.consumer(:authorize)
    request_token = OAuth::RequestToken.new(consumer, session[:request_token], session[:request_token_secret])
    if params[:not_approved] == "true"
      flash[:error] = "Oops! Looks like you didn't complete authentication with Dropbox."
      redirect_to root_url
    else
      result = request_token.get_access_token(oauth_verifier: params[:oauth_token])

      session[:token] = result.token
      session[:secret] = result.secret

      client = Dropbox::API::Client.new :token => session[:token], :secret => session[:secret]
      session[:email] = client.account.email

      redirect_to new_user_registration_url
    end
  end

  # def create_user_and_return_home(result)

  # 	puts "result.token: #{result.token}"
  # 	puts "result.secret: #{result.secret}"


  #   if user = User.find_by_dropbox_uid(params[:uid])
  #     user.update_attributes(access_token: result.token, access_secret: result.secret)
  #     if user.waitlist
  #       flash[:notice] = "Success!"
  #       redirect_to controller: 'home', action: 'show', id: user.id
  #     else
  #       flash[:notice] = "Success!"
  #       redirect_to controller: 'home', action: 'show', id: user.id
  #     end
  #   else
  #     user = User.create!(access_token: result.token, access_secret: result.secret, dropbox_uid: params[:uid])
  #     flash[:notice] = "Beauty! You've succesfully authorized Splashbox with Dropbox."
  #     redirect_to controller: 'home', action: 'show', id: user.id
  #   end
  # end
end
