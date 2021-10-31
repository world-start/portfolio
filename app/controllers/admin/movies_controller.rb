class Admin::MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
  end

  def destroy
  end

  private
  def list_params
    params.require(:movie).permit(:review_id, :title, :image, :introduction, :created_year, :director, :cast)
  end
end
