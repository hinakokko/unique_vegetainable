class Admin::CommentsController < ApplicationController

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_back fallback_location: admin_top_path
  end

end
