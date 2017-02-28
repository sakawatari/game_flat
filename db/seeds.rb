# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times do |n|
  email = Faker::Internet.email
  name = Faker::Name.first_name
  password = "password"
  uid = Faker::Number.number(36)
  User.create!(
    email: email,
    name: name,
    password: password,
    password_confirmation: password,
    uid: uid
   )
end

20.times do |n|
  title = Faker::Pokemon.name
  game_title = Faker::Pokemon.location
  content = Faker::Book.title
  user_id = User.offset( rand(User.count) ).first.id
  Topic.create!(
    title: title,
    game_title: game_title,
    content: content,
    user_id: user_id
  )
end
