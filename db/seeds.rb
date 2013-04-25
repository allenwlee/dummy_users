require 'faker'

10.times do
  User.create(email: Faker::Internet.email, password: Faker::Name.first_name)
end
