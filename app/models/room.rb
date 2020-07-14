class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  
  has_many :notifications, dependent: :destroy
  # 以下通知
  # def create_notification_message!(current_user, message_id)
  #   #同じ投稿にコメントしているユーザーに通知を送る。（current_userと投稿ユーザーのぞく）
  #   temp_ids = Message.select(:user_id).where(room_id: id).where.not(user_id: current_user.id).distinct
  #   #取得したユーザー達へ通知を作成。（user_idのみ繰り返し取得）
  #   temp_ids.each do |temp_id|
  #     save_notification_message!(current_user, message_id, temp_id['user_id'])
  #   end
  #   #投稿者へ通知を作成
  #   save_notification_message!(current_user, message_id, user_id) if temp_ids.blank?
  # end
  
  # def save_notification_message!(current_user, message_id, visited_id)
  #   notification = current_user.active_notifications.new(
  #     room_id: id,
  #     message_id: message_id,
  #     visited_id: visited_id,
  #     action: 'message'
  #   )
  #   if notification.visitor_id == notification.visited_id
  #     notification.checked = true
  #   end
  #   notification.save if notification.valid?
  # end
end
