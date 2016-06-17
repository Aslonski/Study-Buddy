class AccountApplicationsController < ActionController::Base
  def edit
    @teacher = Teacher.find_by(email: params[:email])
  end

  def update
    @teacher = Teacher.find_by(id: params[:id])
    if @teacher && teacher.email_authenticated?(params[:id])
      @teacher.update(activated: true)
      if @teacher.activated?
        @teacher.update(activation_digest: "", password: account_params[:password])
        redirect_to root_path
      else
        flash[:warning] = "Account not activated.  Please contact your administrator."
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  private

  def account_params
    params.require(:teacher).permit(:password)
  end
end
