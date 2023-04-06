FactoryBot.define do
  factory :review do
    content { 'MyText' }
    user { nil }
    brewery { nil }
  end
end
