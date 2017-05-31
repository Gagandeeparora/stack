class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_logged_in?
  
  private
  
  def sign_in user
    session[:user_id] = user.id
  end

  def current_user
    @current_user = nil
    unless session[:user_id].nil?
      @current_user = User.find_by(id: session[:user_id]['$oid'])
    end
  end

  def user_logged_in?
    true if session[:user_id]
  end
end
