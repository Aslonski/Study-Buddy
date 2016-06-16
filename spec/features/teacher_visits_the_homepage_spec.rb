require 'rails_helper'

feature "Visiting the homepage" do
  scenario "Teacher visits the homepage" do
    Teacher.create!(name: "Danny", email: "me@me.me", password: "password")

    visit '/'

    fill_in "Email", :with => "me@me.me"
    fill_in "Password", :with => "password"
    click_button "Login"

    expect(page).to have_text("Danny")
    expect(page).to have_text("Log Out")
    end
  end


