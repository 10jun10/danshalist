class ToppagesController < ApplicationController
  def index
    @items = Item.order(id: :desc).page(params[:page])
  end
end
