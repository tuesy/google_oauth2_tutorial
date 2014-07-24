class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create
  skip_before_filter :require_google_apps_authentication

  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
