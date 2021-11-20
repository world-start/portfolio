require 'rails_helper'

describe '[STEP1] ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'ログインリンクが表示される:クリックするとログインログイン画面へ遷移する' do
        expect(page).to have_link 'ログイン'
        click_on 'ログイン'
      	expect(current_path).to match("/users/sign_in")
      end
      it '新規登録リンクが表示される:クリックすると新規登録画面へ遷移する' do
        expect(page).to have_link '新規登録'
        click_on '新規登録'
        expect(current_path).to match("/users/sign_up")
      end
      it 'Aboutリンクが表示される:クリックするとAbout画面へ遷移する' do
        expect(page). to have_link 'About'
        click_on 'About'
        expect(current_path). to match('/homes/about')
      end
      it 'Homeリンクが表示される:クリックするとHome画面へ遷移する' do
        expect(page). to have_link 'Home'
        click_on 'Home'
        expect(current_path). to match('/')
      end
      it 'Movie Mapsリンクが表示される:クリックするとHome画面へ遷移する' do
        expect(page). to have_link 'Movie Maps'
        click_on 'Movie Maps'
        expect(current_path). to match('/')
      end
      # it '検索エンジンが表示される:クリックすると検索結果へ遷移する' do
      #   expect(page).to have_selector 'form'
      # end
      # it '映画のshowページリンクが表示される:クリックすると画面へ遷移する' do
      #   expect(page).to have_selector 'a'
      #   click_on 'a'
      #   expect(current_path).to eq '/movies/[:id]'
      # end
    end
  end
 end

 describe 'ユーザ新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
      it '「新規会員登録」と表示される' do
        expect(page).to have_content '新規会員登録'
      end
      it 'nicknameフォームが表示される' do
        expect(page).to have_field 'user[nickname]'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it '新規登録ボタンが表示される' do
        expect(page).to have_button '新規登録'
      end
      it '「既に登録済みの方」と表示される' do
        expect(page).to have_content '既に登録済みの方'
      end
      it '「こちら」リンクが表示される:クリックするとログイン画面へ遷移する' do
        expect(page). to have_link 'こちら'
        click_on 'こちら'
        expect(current_path).to match('/users/sign_in')
      end
    end

    # ---Fakerを使う書き方---
    # context '新規登録成功のテスト' do
    #   before do
    #     fill_in 'user[nickname]', with: Faker::Lorem.characters(number: 10)
    #     fill_in 'user[email]', with: Faker::Internet.email
    #     fill_in 'user[password]', with: 'password'
    #     fill_in 'user[password_confirmation]', with: 'password'
    #   end

    #   it '正しく新規登録される' do
    #     expect { click_button '新規登録' }.to change(User.all, :count).by(1)
    #   end
    # end

    context '新規登録成功のテスト' do
      it '正しく新規登録される' do
        user = User.new(nickname: 'ネーム', email: 'test@email.com', password: '123456', password_confirmation: '123456')
        fill_in 'user[nickname]', with: user.nickname
        fill_in 'user[email]',with: user.email
        fill_in 'user[password]', with: user.password
        fill_in 'user[password_confirmation]', with: user.password_confirmation

        expect { click_button '新規登録' }.to change(User.all, :count).by(1)
        # '新規登録後のリダイレクト先が、新規登録できたマイページ画面になっている'
        expect(current_path).to eq '/mypage'
      end
   end
  end

  describe 'ユーザログインのテスト' do
    #let(:user) { create(:user) }
    before do
      visit new_user_session_path
    end
    context 'ログイン成功のテスト' do
      it 'ログイン後のリダイレクト先が、ログインしたユーザのマイページ画面になっている' do
        user = User.new(nickname: 'ニックネーム', email: 'test@email.com', password: '123456')
        user.save!
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        expect(current_path).to eq '/mypage'
      end
    end

    context 'ログイン失敗のテスト' do
      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        user = User.new(nickname: 'ニックネーム', email: 'test@email.com', password: '123456')
        user.save!
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end