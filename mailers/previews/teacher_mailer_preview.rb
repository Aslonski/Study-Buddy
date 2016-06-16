class TeacherMailerPreview < ActionMailer::Preview
  def account_activation
    teacher = Teacher.last
    teacher.activation_token = Teacher.new_token
    TeacherMailer.account_activation(teacher)
  end
end
