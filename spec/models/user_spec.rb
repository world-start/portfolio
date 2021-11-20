require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    user = User.new(nickname: 'ニックネーム', email: 'メールアドレス')
      it '空欄でないこと' do
        expect(user.nickname).to_not eq ""
        expect(user.email).to_not eq ""
      end
    end
   
  end