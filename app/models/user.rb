require_relative '../enums/prefecture'

class User < ApplicationRecord
  include Prefecture
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader
  before_save :write_avatar_identifier
  after_commit :remove_avatar!, on: :destroy
  after_commit :mark_remove_avatar_false, on: :update
  after_commit :remove_previously_stored_avatar, on: :update
  after_commit :store_avatar!, on: :update

  has_many :reviews, dependent: :destroy
  has_many :keeps, dependent: :destroy
  has_many :keep_breweries, through: :keeps, source: :brewery
  has_many :likes, dependent: :destroy
  has_many :like_breweries, through: :likes, source: :brewery

  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
  validates :self_introduction, length: { maximum: 300 }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, length: { minimum: 8 }, confirmation: true, if: -> { new_record? || changes[:crypted_password] }, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }, on: :create
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  enum role: { general: 0, admin: 1 }
  enum favorite_liquor_type: { beer: 0, wine: 1, sake: 2, whiskey: 3 }

  def own?(object)
    id == object.user_id
  end

  def keep(brewery)
    keep_breweries << brewery
  end

  def unkeep(brewery)
    keep_breweries.destroy(brewery)
  end

  def keep?(brewery)
    keep_breweries.include?(brewery)
  end

  def like(brewery)
    like_breweries << brewery
  end

  def unlike(brewery)
    like_breweries.destroy(brewery)
  end

  def like?(brewery)
    like_breweries.include?(brewery)
  end
end
