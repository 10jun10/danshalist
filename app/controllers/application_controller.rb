class ApplicationController < ActionController::Base
  # before_action :set_search
  
  include SessionsHelper
  
  # def set_search
  #@search = Article.search(params[:q])
  #   @search = Item.ransack(params[:q]) #ransackメソッド推奨
  #   @search_items = @search.result.page(params[:page])
  # end
  
  private
  
  def require_user_logged_in
    unless logged_in?
      flash[:danger] = "ログインが必要です"
      redirect_to login_url
    end
  end
end
