class Review < ApplicationRecord
  belongs_to :user
  belongs_to :brewery

  validates :content, presence: true, length: { minimum: 10, maximum: 65_535 }
end
