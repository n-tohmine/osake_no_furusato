FactoryBot.define do
  factory :review do
    content { "テストレビュー投稿。テストブルワリー。" }
    star { 5.0 }
    user { association :user }
    brewery { association :brewery }
  end
end
