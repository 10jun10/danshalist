class Item < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 40 }
  
  # 画像アップロード
  mount_uploader :image, ImageUploader
  #コメント機能
  has_many :comments, dependent: :destroy

end
