class Item < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 40 }
  
  # 画像アップロード
  mount_uploader :image, ImageUploader
  #コメント機能
  has_many :comments
  
    # 検索機能
  def self.search(search) #ここでのself.はItem.を意味する
    if search
      where(['name LIKE ?', "%#{search}%"]) #検索とitemの部分一致を表示。.は省略
    else
      all #全て表示。Item.は省略
    end
  end

end
