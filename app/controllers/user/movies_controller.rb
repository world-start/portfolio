class User::MoviesController < ApplicationController
  
   def show
     @movie = Movie.find(params[:id])
     @reviews = @movie.reviews
   end
   
   def search
    method = params[:search_method]
    word = params[:search_word]
    @movies = Movie.search(method,word)
   end
end