class SessionsController < ApplicationController

  def new
  end

  def create
    auth = request.env['omniauth.auth']
    user = User.where(provider: auth.provider, uid: auth.uid.to_s).first || User.create_with_omniauth(auth)
    user.update! info: auth.info
    reset_session
    session[:user_id] = user.id.to_s
    respond_to do |format|
      flash[:notice] = 'Signed in!'
      format.html { redirect_to root_url }
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end

end
