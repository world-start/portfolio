class User::CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    byebug
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.save
    redirect_to review_path(comment.review_id)
  end

  private
  def review_params
    params.require(:review).permit(:movie_id, :comment_id, :score, :content)
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :review_id)
  end

  def user_params
    params.require(:user).permit(:nickname)
  end
end
