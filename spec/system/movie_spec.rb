# frozen_string_literal: true

require 'rails_helper'
describe '投稿のテスト' do
	  let!(:movie) { create(:movie,title:'',image_id:'', introduction:'', created_year:'', director:'', cast:'') }
	  describe 'トップ画面(root_path)のテスト' do
	    before do
	      visit root_path
	    end
	    context '表示の確認' do
	      it 'トップ画面(root_path)にHomeページへのリンクが表示されているか' do
	        expect(page).to have_link "", href: root_path
	      end
	      it 'トップ画面(root_path)にAboutページへのリンクが表示されているか' do
	        expect(page).to have_link "", href: homes_about_path
	      end
	      it 'トップ画面(root_path)に新規登録ページへのリンクが表示されているか' do
	        expect(page).to have_link "", href: new_user_session_path
	      end
	      it 'トップ画面(root_path)にログインページへのリンクが表示されているか' do
	        expect(page).to have_link "", href: new_user_registration_path
	      end
	      it 'root_pathが"/"であるか' do
	        expect(current_path).to eq('/')
	      end
	     # it "movieの画像・タイトル・年代・ジャンルを表示し、画像に詳細のリンクが貼れているか" do
	     #       expect(page).to have_content movie.image_id
	     #       expect(page).to have_content movie.title
	     #       expect(page).to have_content movie.created_year
	     #       expect(page).to have_content movie.genre_id
	     #       expect(page).to have_content movie.director
	     #       expect(page).to have_content movie.cast
	     #       expect(page).to have_content movie.introduction
	     #       # Showリンク
	     #       show_link = find_all('a')[j]
	     #       expect(show_link.native.inner_text).to match(/show/i)
	     #       expect(show_link[:href]).to eq movie_path(movie)
	     #     end
	      end
	    end
	  end

	 context '映画の新規登録に関するテスト' do
      let!(:movie) do
        Movie.new({title:"", created_year:"", director:"", cast:"", introduction:""})
      end
      it '映画を保存できる' do
        expect(movie).to be_valid
      end
      it '保存に失敗する' do
        click_button '登録する'
        expect(page).to have_content 'error'
        expect(current_path).to eq('/admin/movies/new')
      end
      it '登録後のリダイレクト先は正しいか' do
        # fill_in 'movie[image_id]', with: Faker::Lorem.characters(number:5)
        fill_in 'movie[title]', with: Faker::Lorem.characters(number:20)
        fill_in 'movie[created_year]', with: Faker::Lorem.characters(number:20)
        # fill_in 'movie[genre_id]', with: Faker::Lorem.characters(number:20)
        fill_in 'movie[director]', with: Faker::Lorem.characters(number:20)
        fill_in 'movie[cast]', with: Faker::Lorem.characters(number:20)
        fill_in 'movie[introduction]', with: Faker::Lorem.characters(number:20)
        click_button '登録する'
        expect(page).to have_current_path admin_root_path(Movie.last)
      end
   end
    context 'movie削除のテスト' do
      it 'movieの削除' do
        expect{ movie.destroy }.to change{ Movie.count }.by(-1)
        # ※本来はダイアログのテストまで行うがココではデータが削除されることだけをテスト
      end
    end

	  describe '詳細画面のテスト' do
	    before do
	      visit movie_path(movie)
	    end
	    context '表示の確認' do
       it '映画の画像・タイトル・年代・ジャンル・監督・出演・概要が画面に表示されている' do
	        expect(page).to have_content movie.image_id
	        expect(page).to have_content movie.title
	        expect(page).to have_content movie.created_year
	        expect(page).to have_content movie.genre_id
	        expect(page).to have_content movie.director
	        expect(page).to have_content movie.cast
	        expect(page).to have_content movie.introduction
	      end
	      it 'レビューを投稿するリンクが表示される' do
	        new_link = find_all('a')[0]
	        expect(new_link.native.inner_text).to match(/new/i)
				end
  	    context 'リンクの遷移先の確認' do
  	      it 'レビューを投稿するの遷移先は投稿画面か' do
  	        edit_link = find_all('a')[0]
  	        edit_link.click
  	        expect(current_path).to eq('/books/' + book.id.to_s + '/edit')
  	    　end
  	  　end
	    end
	  end
	  end
	end