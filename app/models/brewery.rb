class Brewery < ApplicationRecord
  has_many :keeps, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy

  enum liquor_type: { beer: 0, wine: 1, sake: 2, whiskey: 3 }
end
