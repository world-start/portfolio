class User::CommentsController < ApplicationController
  def show
    # @movie = Movie.find(params[:id])
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  def reviewer
    @user = User.find(params[:id])
    @review = @user.review
  end

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    comment.save
    redirect_to comment_path(comment)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :review_id)
  end

  def user_params
    params.require(:user).permit(:nickname)
  end
end
