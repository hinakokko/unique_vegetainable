class User::HomesController < ApplicationController

  before_action :authenticate_user!

  def show
    @vegetainable_review = VegetainableReview.find(params[:id])
  end


end
