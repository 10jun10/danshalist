require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = build(:user)
  end

  describe 'バリデーション' do
    it 'nameとemailどちらも値が設定されていれば、OK' do
      expect(@user.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end
    
    it "重複したemailが存在する場合NG" do
      @user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
   end
   
   it "passwordがない場合はNG" do
     @user = build(:user, password: "")
     @user.valid?
     expect(@user.errors[:password]).to include("を入力してください")
   end
   
   it "passwordが存在してもpassword_confirmationがない場合はNG" do
     @user = build(:user, password_confirmation: "")
     @user.valid?
     expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
   end
   
   it "passwordが6文字以上であればOK" do
     @user = build(:user, password: "123456", password_confirmation: "123456")
     @user.valid?
     expect(@user).to be_valid
   end
    
   it "passwordが5文字以下である場合はNG" do
     @user = build(:user, password: "12345", password_confirmation: "12345")
     @user.valid?
     expect(@user.errors[:password]).to include("は6文字以上で入力してください")
   end  
    
  end
  
  
  # pending "add some examples to (or delete) #{__FILE__}"
end
