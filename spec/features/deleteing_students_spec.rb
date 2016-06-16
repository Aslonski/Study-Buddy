require 'rails_helper'

feature "Deleting students" do
  scenario "Admin deletes 1 student" do
    Teacher.create!(name: "Danny", email: "me@me.me", password: "password", admin: true)

    student_to_delete = Student.create!(first_name: "Student", last_name: "StudentA", disciplinary_strikes: 0, grade: 4, age: 10, gpa: 3, shirt_size: "S")
    Student.create!(first_name: "Student", last_name: "StudentB", disciplinary_strikes: 0, grade: 4, age: 10, gpa: 3, shirt_size: "S")
    Student.create!(first_name: "Student", last_name: "StudentC", disciplinary_strikes: 0, grade: 4, age: 10, gpa: 3, shirt_size: "S")

    visit '/'

    fill_in "Email", :with => "me@me.me"
    fill_in "Password", :with => "password"
    click_button "Login"

    visit "/students"

    find(:css, "input[type='checkbox'][value='#{student_to_delete.id}']").set(true)
    click_button "Delete Student(s)"

    visit "/students"

    expect(page).to_not have_text("StudentA")
    expect(page).to have_text("StudentB")
    expect(page).to have_text("StudentC")

  end

  scenario "Admin deletes multiple students" do
    Teacher.create!(name: "Danny", email: "me@me.me", password: "password", admin: true)

    student1 = Student.create!(first_name: "Student", last_name: "StudentA", disciplinary_strikes: 0, grade: 4, age: 10, gpa: 3, shirt_size: "S")
    student2 = Student.create!(first_name: "Student", last_name: "StudentB", disciplinary_strikes: 0, grade: 4, age: 10, gpa: 3, shirt_size: "S")
    Student.create!(first_name: "Student", last_name: "StudentC", disciplinary_strikes: 0, grade: 4, age: 10, gpa: 3, shirt_size: "S")

    visit '/'

    fill_in "Email", :with => "me@me.me"
    fill_in "Password", :with => "password"
    click_button "Login"

    visit "/students"

    find(:css, "input[type='checkbox'][value='#{student1.id}']").set(true)
    find(:css, "input[type='checkbox'][value='#{student2.id}']").set(true)
    click_button "Delete Student(s)"

    visit "/students"

    expect(page).to_not have_text("StudentA")
    expect(page).to_not have_text("StudentB")
    expect(page).to have_text("StudentC")
  end
end
