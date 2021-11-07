class User::UsersController < ApplicationController
  def show
   @review = Review.find(params[:id])
   @user = @review.user
   @reviews = @user.reviews
  end
end