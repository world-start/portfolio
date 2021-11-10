class Admin::MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    movie = Movie.new(movie_params)
    movie.save
    redirect_to admin_root_path
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to admin_root_path
  end

   def search
    method = params[:search_method]
    word = params[:search_word]
    @movies = Movie.search(method,word)
   end
   
  private
  def movie_params
    params.require(:movie).permit(:review_id, :title, :image, :introduction, :created_year, :director, :cast, :genre_id)
  end
end
