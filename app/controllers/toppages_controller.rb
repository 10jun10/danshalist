class ToppagesController < ApplicationController
  def index
    # @items = Item.order(id: :desc).page(params[:page]).per(18)
    # @items = Item.order(id: :desc).page(params[:page]).per(18).search(params[:search])
    # @items = Item.order(updated_at: :desc).page(params[:page]).per(18)
    
    # @search = Item.ransack(params[:q])
    # @items = @search.result.order(updated_at: :desc).page(params[:page]).per(18)
  end
  
  def about
    
  end
  
end

#.where(activated: true).
