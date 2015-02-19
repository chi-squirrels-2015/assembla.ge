require 'faker'

User.create(name: "Miriam Moore", username: "mmdesign007", email: "miriamsusanmoore@mm.com", password:"123")
User.create(name: "Matthew Who", username: "matthewwho", email: "matthewwho@me.com", password:"123")
User.create(name: "Test User", username: "test", email: "test@test.com", password:"123")

5.times do
  User.create!(name: Faker::Name.name,
               username: Faker::Internet.user_name,
               email: Faker::Internet.email,
               password: "123")
end

# Seed check to verify that user cannot follow self
# Following.create!(originator_id: 1, follower_id: 1)

Following.create!(originator_id: 2, follower_id: 1)
Following.create!(originator_id: 1, follower_id: 2)
Following.create!(originator_id: 3, follower_id: 4)

Post.create!(poster_id: 1, content: "#SomethingAwesome is Coming...")

100.times {Post.create!(poster_id: rand(1..5), content: Faker::Lorem.paragraph)}

60.times { Tagging.create!(post_id: rand(1..100), tag_id: rand(1..50)) }

Tag.create(content: "SomethingAwesome")

5.times {Tag.create(content: Faker::Lorem.word)}
