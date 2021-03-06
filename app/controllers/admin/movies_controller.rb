class Admin::MoviesController < ApplicationController
  def new
    @movie = Movie.new
    @movie.genre
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)
    redirect_to admin_root_path
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to admin_root_path
  end

   def search
    method = params[:search_method]#なぜか変数methodを入れると上手くいく
    word = params[:search_word]
    @movies = Movie.search(method,word)#←ここも
   end

  private
  def movie_params
    params.require(:movie).permit(:review_id, :genre_id, :title, :image, :introduction, :created_year, :director, :cast)
  end
  def genre_params
    params.require(:genre).permit(:name)
  end
end
