class User::CommentsController < ApplicationController

  def create
    vegetainable_review = VegetainableReview.find(params[:vegetainable_review_id])
    comment = current_user.comments.new(comment_params)
    comment.vegetainable_review_id = vegetainable_review.id
    comment.save
    redirect_to vegetainable_review_path(vegetainable_review)
  end

  def destroy
    comment = current_user.comments
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_back fallback_location: root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
