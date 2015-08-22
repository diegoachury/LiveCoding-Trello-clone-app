class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_user
    access_denied unless logged_in?
  end

  def require_same_user
    user_id = params[:user_id] || params[:id]
    access_denied unless logged_in? && session[:user_id] == user_id.to_i
  end

  def access_denied
    flash[:danger] = "You have been a naughty boy/girl and I have to report you now!"
    redirect_to root_path
  end
end
