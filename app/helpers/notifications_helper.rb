module NotificationsHelper
  def notification_form(notification)
    #通知を送ってきたユーザーを取得
    @visitor = notification.visitor
    #コメントの内容を通知に表示する
    @comment = nil
    @visitor_comment = notification.comment_id
    #メッセージの内容を通知に表示する
    @message = nil
    @visitor_message = notification.message_id
    # notification.actionがfollowかfavoriteかcommentかで処理を変える
    case notification.action
    when 'comment' then
      #コメントの内容と投稿のタイトルを取得　      
      @comment = Comment.find_by(id: @visitor_comment)
      @comment_content = @comment.content
      @item_name = @comment.item.name
      tag.a(@visitor.name, href: user_path(@visitor)) + 'が' + tag.a("#{@item_name}", href: item_path(notification.item_id)) + 'にコメントしました'

    when 'message' then
      #DMの内容と投稿のDMの相手を取得　      
      @message = Message.find_by(id: @visitor_message)
      @message_content = @message.content
      # @message_title = @comment.room.name
      tag.a(@visitor.name, href: user_path(@visitor)) + 'から' + tag.a("DM", href: room_path(notification.room_id)) + 'が来ました'
    end
    
  end
  
  # 通知の知らせ
  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end