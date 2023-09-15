FactoryBot.define do
  factory :brewery do
    name { "テストブルワリー" }
    address { Faker::Address.full_address }
    phone_number { "000-000-0000" }
    prefecture { Faker::Address.state }
    liquor_type { 0 }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
