class TeachersController < ApplicationController

  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = find_teacher
  end

  def new
    @teacher = Teacher.new
  end

  def edit
    @teacher = find_teacher
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.password = "temp"
    if @teacher.save
      TeacherMailer.account_activation(@teacher).deliver_now
      redirect_to admin_path
    else
      render "new"
    end
  end

  def update
    @teacher = find_teacher
    if @teacher.update(teacher_params)
      redirect_to teacher_path
    else
      render "edit"
    end
  end

  def destroy
    @teacher = find_teacher
    @teacher.destroy
    redirect_to root_path
  end

  def admin
    @teacher = Teacher.new
    @student = Student.new
    render "admin"
  end

  private

  def find_teacher
    Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:name, :email, :admin)
  end

end
