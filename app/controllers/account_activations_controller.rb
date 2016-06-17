class AccountActivationsController < ActionController::Base
  def edit
    @teacher = Teacher.find_by(email: params[:email])
  end

  def update
    @teacher = Teacher.find_by(name: account_params[:name])

    p @teacher
    if @teacher && @teacher.email_authenticated?(params[:id])
      @teacher.update(activated: true)
      if @teacher.activated?
        @teacher.update(activation_digest: "")
        p account_params[:new_password]
        @teacher.new_password(account_params[:password])
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
    params.require(:teacher).permit(:password, :email, :name)
  end
end
