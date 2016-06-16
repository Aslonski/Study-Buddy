class TeacherMailer < ApplicationMailer
  def account_activation(teacher)
    p "========="
    p teacher
    p "SENDING EMAIL"
    @teacher = teacher
    mail to: @teacher.email, subject: "Welcome to Study Buddy!"
  end
end
