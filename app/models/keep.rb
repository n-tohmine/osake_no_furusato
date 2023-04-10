class Keep < ApplicationRecord
  belongs_to :user
  belongs_to :brewery

  validates :user_id, uniqueness: { scope: :brewery_id }
end
