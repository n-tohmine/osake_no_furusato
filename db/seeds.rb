require 'faker'

20.times do |n|
  name = "user0#{n}"
  email = Faker::Internet.email
  password = 'fakerpassword0'
  password_confirmation = 'fakerpassword0'
  living_place = Faker::Address.state
  favorite_liquor_type = 0
  self_introduction = Faker::JapaneseMedia::StudioGhibli.quote 
  role = 0
  User.create!(name: name, email: email, password: password, password_confirmation: password_confirmation, role: role, living_place: living_place, favorite_liquor_type: favorite_liquor_type, self_introduction: self_introduction)
end
