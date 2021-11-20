require 'rails_helper'

describe '[STEP1] ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
      byebug
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      # it 'ログインリンクが表示される' do
      # 	expect(new_user_session_link).to match(/Log in/)
      # end
    end
  end
 end