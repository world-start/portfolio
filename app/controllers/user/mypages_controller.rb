class User::MypagesController < ApplicationController
  def mypage
  end

  def show
    @user = current_user
    @reviews = @user.reviews
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to mypage_path(current_user)
  end

  private
  def review_params
    params.require(:review).permit(:movie_id, :comment_id, :score, :content)
  end

  def movie_params
    params.require(:movie).permit(:review_id, :title, :image, :introduction, :created_year, :director, :cast, :genre_id)
  end

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
