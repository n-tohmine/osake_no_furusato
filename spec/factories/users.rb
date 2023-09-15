FactoryBot.define do
  factory :user do
    name { "test_user" }
    email { Faker::Internet.email }
    living_place { 12 }
    favorite_liquor_type { 0 }
    sequence(:self_introduction) { |n| "自己紹介テスト。テストユーザー#{n}の自己紹介" }
    password { "password000" }
    password_confirmation { "password000" }
  end
end
