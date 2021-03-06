# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Hipster.words(number: 1).first,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  puts "You just created 10 user seeds!"
end

10.times do
  Nugget.create!(
    title: Faker::GreekPhilosophers.quote,
    description: Faker::ChuckNorris.fact,
    external_link: Faker::Internet.url,
    user_id: rand(1..10)
  )
  puts "You just created 10 nuggets!"
end
