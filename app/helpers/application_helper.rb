module ApplicationHelper
  def current_teacher
    @current_teacher ||= Teacher.find(session[:teacher_id])
  end

  def logged_in?
    session[:teacher_id] != nil
  end

  def check_logged_in
    redirect_to new_session_path unless logged_in?
  end
end
