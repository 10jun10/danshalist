class ToppagesController < ApplicationController
  def index
    # @items = Item.order(id: :desc).page(params[:page]).per(18)
    @items = Item.order(updated_at: :desc).page(params[:page]).per(18)
    # @items = Item.order(id: :desc).page(params[:page]).per(18).search(params[:search])
  end
end

#.where(activated: true).
