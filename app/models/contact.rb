class Contact
  include ActiveModel::Model
  attr_accessor :name, :email, :content

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true
  validates :content, presence: true, length: { maximum: 500 }
end
