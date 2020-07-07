require 'rails_helper'

describe UsersController, type: :controller do
  
  # show
  # describe 'GET #show' do
    
  # end
  
  # new
  describe 'GET #new' do
    it 'リクエストが成功すること' do
      get :new
      expect(response.status).to eq 200
    end

    it 'newテンプレートで表示されること' do
      get :new
      expect(response).to render_template :new
    end

    it '@userがnewされていること' do
      get :new
      expect(assigns :user).to_not be_nil
    end
  end
  
  # create
  # describe 'POST #create' do
  #   content '正しいユーザー情報が渡ってきた場合' do
  #   end
  # end
end
