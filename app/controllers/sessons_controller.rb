class SessionsController < ApplicationController
  def create

    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:teacher_id] = teacher.id
      redirect_to root_path
    else
      @message = "Sorry, either your email or password was incorrect, please try again"
      render :new
    end

  end

  def destroy
    session.clear
    redirect_to new_sessions_path
  end

  private
    def session_params
      params.permit(:email, :password)
    end
end