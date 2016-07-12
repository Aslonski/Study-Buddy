# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Student.destroy_all
Teacher.destroy_all

 sizes = ["S", "M", "L", "XL", "XXL"]

15.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(5..18),
    grade: rand(0..12),
    gpa: rand(0..4).to_f,
    disciplinary_strikes: rand(0..5),
    teacher_id: rand(0..2),
    shirt_size: sizes.sample,
    profile_pic: Faker::Avatar.image("my-own-slug", "50x50")
  )
end


Teacher.create!(
 name: "Chris P. Bacon",
 email: "chris.p.bacon@gmail.com",
 password: "password",
 admin: true,
 activated: true
 )

Teacher.create!(
 name: Faker::Name.first_name,
 email: Faker::Internet.email,
 password: "password",
 activated: true,
 admin: false
)

Teacher.create!(
 name: Faker::Name.first_name,
 email: Faker::Internet.email,
 password: "password",
 activated: true,
 admin: false
 )
