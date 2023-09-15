FactoryBot.define do
  factory :review do
    content { "テストレビューの作成・投稿" }
    star { 3.5 }
  end
end
