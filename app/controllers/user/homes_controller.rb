class User::HomesController < ApplicationController
  def top
    @movies = Movie.page(params[:page]).per(6)
  end

  def about
  end
end
