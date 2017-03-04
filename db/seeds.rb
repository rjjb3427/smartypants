# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Starting to run seeds file..."

100.times do |topic|
  Topic.create!(title: "My Title #{topic}")
end

puts "100 Topics created"

User.create!(
    email: "admin@test.com",
    password: "asdfasdf",
    password_confirmation: "asdfasdf",
    first_name: "Jon",
    last_name: "Snow",
    username: "wallwatcher",
    role: "admin"
)

puts "Admin user created"

User.create!(
    email: "student@test.com",
    password: "asdfasdf",
    password_confirmation: "asdfasdf",
    first_name: "Jon",
    last_name: "Snow",
    username: "youngwallwatcher",
    role: "student"
)

puts "Student user created"
