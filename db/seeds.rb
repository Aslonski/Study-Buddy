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

5.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(5..18),
    grade: rand(0..12),
    gpa: rand(0..4).to_f,
    disciplinary_strikes: rand(0..5),
    teacher_id: rand(1..2),
    shirt_size: sizes.sample,
    profile_pic: Faker::Avatar.image("my-own-slug", "50x50")
  )
end


Teacher.create!(
 name: "Danny",
 email: "jill@jill.jill",
 password: "password",
 admin: true)

Teacher.create!(
 name: Faker::Name.first_name,
 email: Faker::Internet.email,
 password: "password",
 admin: true)

Teacher.create!(
 name: Faker::Name.first_name,
 email: Faker::Internet.email,
 password: "password",
<<<<<<< HEAD
 activated: false,
=======
>>>>>>> fbfd7effc15e25e22c985e4ef3ab6b7402cfd510
 admin: false)
