# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movieモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    movie = Movie.new(id:99, title: 'タイトル', cast: '出演', director: '監督', created_year: 1994, introduction: 'あらすじ', image_id: '画像')
    context 'titleカラム' do
      it '空欄でないこと' do
        expect(movie.title).to_not eq ""
      end
    end
    context 'introductionカラム' do
      it '空欄でないこと' do
        expect(movie.introduction).to_not eq ""
      end
    end
    context 'cast,director,created_yearカラム' do
      it '空欄でないこと' do
        expect(movie.director).to_not eq ""
        expect(movie.cast).to_not eq ""
        expect(movie.created_year).to_not eq ""
      end
    end
    # context 'image_idカラム' do
    #   it '空欄でないこと' do
    #     expect(movie.image).to_not eq ""
    #   end
    # end
  end
end