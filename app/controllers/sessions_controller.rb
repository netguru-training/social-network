class SessionsController < ApplicationController

  expose(:user) { User.find(1) }
  expose(:events) {user.events}

  def new
  end

  def show
  end

  def create
    auth = request.env['omniauth.auth']
    user = User.where(provider: auth.provider, uid: auth.uid.to_s).first || User.create_with_omniauth(auth)
    user.update! info: auth.info
    reset_session
    session[:user_id] = user.id.to_s
    session[:geolocation] = request.env['omniauth.params']
    flash[:notice] = 'Signed in!'
    redirect_to categories_path
  end

  def destroy
    reset_session
    flash[:notice] = 'Sign out.'
    redirect_to root_url
  end

  def failure
    flash[:alert] = "Authentication error: #{params[:message].humanize}"
    redirect_to root_url
  end
end
