require 'rails_helper'

describe '映画登録のテスト' do
    before do
      visit new_admin_session_path
      admin = Admin.new(email: 'test@email.com', password: '123456')
      admin.save!
      fill_in 'admin[email]', with: admin.email
      fill_in 'admin[password]', with: admin.password
      click_button 'ログイン'
      expect(current_path).to eq '/admin'
    end

  # context '新規登録成功のテスト' do
  #     it '新しい投稿が正しく保存される' do
  #       visit new_admin_movie_path
  #       movie = Movie.new(title: 'タイトル', created_year: '1111', director: '監督', cast: '出演', introduction: '概要')
  #       genre = Genre.new(name: 'ジャンル名')
  #       fill_in 'movie[image_id]', with: 'イメージ'
  #       fill_in 'movie[title]', with: 'タイトル'
  #       fill_in 'movie[created_year]', with: '1111'
  #       fill_in 'movie[director]', with: '監督'
  #       fill_in 'movie[cast]', with: '出演'
  #       fill_in 'movie[introduction]', with: '概要'
  #       fill_in 'genre[name]', with: 'ジャンル名'
  #       byebug

  #       expect { click_button '登録する' }.to change(Movie.all, :count).by(1)
  #     end
  #   end

    # context '編集リンクのテスト' do
    #   it '編集画面に遷移する' do
    #     click_link 'Edit'
    #     expect(current_path).to eq '/books/' + book.id.to_s + '/edit'
    #   end
    # end

    # context '削除リンクのテスト' do
    #   before do
    #     click_link 'Destroy'
    #   end

    #   it '正しく削除される' do
    #     expect(Book.where(id: book.id).count).to eq 0
    #   end
    #   it 'リダイレクト先が、投稿一覧画面になっている' do
    #     expect(current_path).to eq '/books'
    #   end
    # end
end