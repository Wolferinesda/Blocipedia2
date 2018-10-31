require 'random_data'

# Create Users
5.times do
  User.create!(
  email:    RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all

 # Create Wikis
50.times do
  Wiki.create!(
    user:   users.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
  wikis = Wiki.all
  user = User.first
  user.update_attributes!(
  email: 'olienad@yahoo.com',
  password: '123123'
)

admin = User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)

standard = User.create!(
  name: 'Standard User',
  email: 'standard@example.com',
  password: 'helloworld'
)

premium = User.create!(
  name: 'Premium User',
  email: 'premium@example.com',
  password: 'helloworld',
  role: 'premium'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
