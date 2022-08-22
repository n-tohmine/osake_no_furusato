class Brewery < ApplicationRecord
  has_many :keeps, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy

  enum liquor_type: {ビール: 0, ワイン: 1, 日本酒: 2, ウイスキー: 3}
end