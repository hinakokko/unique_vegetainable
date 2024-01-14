class User::VegetainableReviewsController < ApplicationController

  def new
    @vegetainable_review = VegetainableReview.new
  end

end
