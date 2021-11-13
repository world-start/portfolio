class User::ReviewsController < ApplicationController
  # before_action :authenticate_user, {only: [:show, :new, :create, :destroy]}
  # index: findメソッドは使えない
  # show: allメソッド使える
  def show
    @review = Review.find(params[:id])
    @comments = @review.comments
    @comment_new = Comment.new
  end

  def new
    @review = Review.new
    @movie = Movie.find(params[:movie_id])
  end

  def create
    review = Review.new(review_params)
    movie =  Movie.find(review_params[:movie_id])
    review.user_id = current_user.id
    review.save
    redirect_to movie_path(movie)
  end

  def destroy
    review = Review.find(params[:id])
    # pp review
    review.destroy!
    redirect_to mypages_path
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :image, :introduction, :created_year, :director, :cast, :genre_id, :review_id)
  end

  def review_params
    params.require(:review).permit(:movie_id, :comment_id, :score, :content)
  end

  def user_params
    params.require(:user).permit(:nickname)
  end

end
