class User::MoviesController < ApplicationController
  
   def show
     @movie = Movie.find(params[:id])
     @reviews = @movie.reviews
   end
end