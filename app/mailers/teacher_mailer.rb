class TeacherMailer < ApplicationMailer
  def account_activation(teacher)
    @teacher = teacher
    mail to: teacher.email, subject: "Welcome to Study Buddy!"
  end
end
