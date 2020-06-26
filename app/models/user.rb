class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  # 画像アップロード
  mount_uploader :image, ImageUploader
  #アイテムとの１対多
  has_many :items, dependent: :destroy
  #コメント機能
  has_many :comments, dependent: :destroy
  # ダイレクトメッセージ機能
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
end
