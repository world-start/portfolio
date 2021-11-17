require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    user = User.new(nickname: 'ニックネーム', email: 'メールアドレス')
    context 'nickname,emailカラム' do
      it '空欄でないこと' do
        expect(user.nickname).to_not eq ""
        expect(user.email).to_not eq ""
      end
    end
    # it '2文字以上であること: 1文字は×' do
    #     user.name = Faker::Lorem.characters(number: 1)
    #     is_expected.to eq false
    #   end
    #   it '2文字以上であること: 2文字は〇' do
    #     user.name = Faker::Lorem.characters(number: 2)
    #     is_expected.to eq true
    #   end
    #   it '20文字以下であること: 20文字は〇' do
    #     user.name = Faker::Lorem.characters(number: 20)
    #     is_expected.to eq true
    #   end
    #   it '20文字以下であること: 21文字は×' do
    #     user.name = Faker::Lorem.characters(number: 21)
    #     is_expected.to eq false
    #   end
    #   it '一意性があること' do
    #     user.name = other_user.name
    #     is_expected.to eq false
    #   end
  end
end