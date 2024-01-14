class User::VegetainableReviewsController < ApplicationController

  def new
    @post_review = PostReview.new
  end

end
