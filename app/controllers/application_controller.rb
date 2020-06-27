class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  # テスト
  before_action :set_search

  def set_search
    @search = Item.ransack(params[:q])
    @items = @search.result.order(updated_at: :desc).page(params[:page]).per(18)
  end
  
  
  # @search = Item.ransack(params[:q])
  # @items = @search.result.order(updated_at: :desc).page(params[:page]).per(18)
  
  private
  
  def require_user_logged_in
    unless logged_in?
      flash[:danger] = "ログインが必要です"
      redirect_to login_url
    end
  end
end
