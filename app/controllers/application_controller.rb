class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  helper_method :current_user

  private

    def current_user
        @current_user ||= User.find(session[:user_id]).decorate if session[:user_id]
    end

    def authenticate_user
      if !current_user
        redirect_to root_path
      end
    end
end
