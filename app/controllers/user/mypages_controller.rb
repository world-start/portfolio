class User::MypagesController < ApplicationController
  def mypage
  end

  def show
    @user = current_user
    @reviews = @user.reviews
  end

  private
  def review_params
    params.require(:review).permit(:movie_id, :comment_id, :score, :content)
  end

  def movie_params
    params.require(:movie).permit(:review_id, :title, :image, :introduction, :created_year, :director, :cast, :genre_id)
  end
end
