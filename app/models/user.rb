class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader
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
  enum living_place: {
    北海道: 0, 青森県: 1, 岩手県: 2, 宮城県: 3, 秋田県: 4, 山形県: 5, 福島県: 6,
    茨城県: 7, 栃木県: 8, 群馬県: 9, 埼玉県: 10, 千葉県: 11, 東京都: 12, 神奈川県: 13,
    新潟県: 14, 富山県: 15, 石川県: 16, 福井県: 17, 山梨県: 18, 長野県: 19,
    岐阜県: 20, 静岡県: 21, 愛知県: 22, 三重県: 23,
    滋賀県: 24, 京都府: 25, 大阪府: 26, 兵庫県: 27, 奈良県: 28, 和歌山県: 29,
    鳥取県: 30, 島根県: 31, 岡山県: 32, 広島県: 33, 山口県: 34,
    徳島県: 35, 香川県: 36, 愛媛県: 37, 高知県: 38,
    福岡県: 39, 佐賀県: 40, 長崎県: 41, 熊本県: 42, 大分県: 43, 宮崎県: 44, 鹿児島県: 45,
    沖縄県: 46
  }
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
