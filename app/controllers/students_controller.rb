class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = find_student
  end

  def new
    @student = Student.new
  end

  def edit
    @student = find_student
  end

  def create
    if params[:select]
      select_multiple
    elsif params[:delete] 
      delete_multiple
    else
      @student = Student.new(student_params)
      if @student.save
        redirect_to students_path
      else
        render "new"
      end
    end
  end

  def update
    @student = find_student
    if @student.update(student_params)
      redirect_to student_path
    else
      render "edit"
    end
  end

  def destroy
    @student = find_student
    @student.destroy
    redirect_to students_path
  end

  def select_multiple
    current_teacher.students.each do |student|
      student.teacher = nil
      student.save
    end
    
    @students = Student.find(params[:student_ids])

    @students.each do |student| 
      student.teacher = current_teacher 
      student.save
    end
    redirect_to teacher_path(id: current_teacher.id)
  end

  def delete_multiple
    @students = Student.find(params[:student_ids])
    @students.each { |student| student.destroy }
    redirect_to students_path
  end

  def select
    @student = find_student
    @student.teacher = current_teacher
    @student.save
    redirect_to student_path
  end

  private

  def find_student
    Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :age, :grade, :gpa, :disciplinary_strikes, :teacher_id, :shirt_size, :profile_pic)
  end

end
