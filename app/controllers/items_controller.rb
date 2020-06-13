class ItemsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit]
  
  def new
    @item = Item.new
  end
  
  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = 'アイテムを追加しました'
      redirect_to root_url
    else
      @items = current_user.items.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'アイテムの追加に失敗しました。'
      render 'toppages/index'
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      flash[:success] = 'アイテムが正常に更新されました'
      redirect_to @item
    else
      flash.now[:danger] = 'アイテムは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = 'アイテムを削除しました'
    # redirect_back(fallback_location: root_path)
    redirect_to root_url
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :image)
  end
  
  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    unless @item
      redirect_to root_url
    end
  end
  
end
