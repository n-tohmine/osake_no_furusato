class Brewery < ApplicationRecord
  has_many :keeps, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy
end