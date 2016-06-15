module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    session[:user_id] != nil
  end

  def check_logged_in
    redirect_to new_session_path unless logged_in?
  end
end
