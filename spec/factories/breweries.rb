FactoryBot.define do
  factory :brewery do
    name { "テストブルワリー" }
    address { "北海道札幌市丸三角町1-1-1" }
    phone_number { "000-000-0000" }
    prefecture { "北海道" }
    liquor_type { 0 }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
