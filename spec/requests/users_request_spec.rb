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
  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      
      it 'リクエストが成功すること' do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
        expect(response.status).to eq 302
      end
      
      it 'ユーザーが登録されること' do
        expect do
          post :create, params: { user: FactoryBot.attributes_for(:user) }
        end.to change(User, :count).by(1)
      end
      
      it 'リダイレクトすること' do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
        expect(response).to redirect_to login_path
      end
    end
   

   
  end
end
