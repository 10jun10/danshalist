class CommentsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @comment = item.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    item = Item.find(params[:item_id])
    @comment = item.comments.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
