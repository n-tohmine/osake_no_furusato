require 'faker'

10.times do |n|
  name = "user0#{n}"
  email = Faker::Internet.email
  password = 'fakerpassword0'
  password_confirmation = 'fakerpassword0'
  living_place = rand(User.prefecture_enums.keys.length)
  favorite_liquor_type =  rand(User.favorite_liquor_types.keys.length)
  self_introduction = Faker::JapaneseMedia::StudioGhibli.quote 
  role = 0
  User.create!(name: name, email: email, password: password, password_confirmation: password_confirmation, role: role, living_place: living_place, favorite_liquor_type: favorite_liquor_type, self_introduction: self_introduction)
end

10.times do |n|
  content = "テストの醸造所レビュー投稿#{n}"
  star = rand(1..5)
  user = User.offset(rand(User.count)).first
  brewery = Brewery.find(1)
  Review.create!(content: content, star: star, user: user, brewery: brewery)
end
