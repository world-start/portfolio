class User::CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.save
    redirect_to review_path(comment.review_id)
  end

  def destroy
    # review = Review.find(params[:id])
    # comments = review.comments
    # comment = comments.current_user.id
    # # comment.user_id = current_user.id
    # comment.destroy
    # redirect_to review_path(comment.review_id)
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
