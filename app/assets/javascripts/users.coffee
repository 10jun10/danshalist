# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#image').click ->
    $('#user_image').click()
    false
    
  $('#user_image').on 'change', (e) ->
    file = e.target.files[0]
    reader = new FileReader
    $preview = $('.user-image')
    t = this
    # 画像ファイル以外の場合は何もしない
    if file.type.indexOf('image') < 0
      return false
    # ファイル読み込みが完了した際のイベント登録
    reader.onload = do (file) ->
      (e) ->
        #既存のプレビューを削除
        $preview.empty()
        # .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.attr('src',e.target.result);
        return
    reader.readAsDataURL file
    return
  return