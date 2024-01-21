class User::VegetainableReviewsController < ApplicationController

  def index
    # @vegetainable_reviews = VegetainableReview.all
    @vegetainable_reviews = params[:tag_id].present? ? Tag.find(params[:tag_id]).vegetainable_reviews : VegetainableReview.all
    @vegetainable_reviews = @vegetainable_reviews.page(params[:page])
  end

  def show
    @vegetainable_review = VegetainableReview.find(params[:id])
    @comment = Comment.new
  end

  def new
    @vegetainable_review = VegetainableReview.new
  end

  def create
    @vegetainable_review = VegetainableReview.new(vegetainable_review_params)
    @vegetainable_review.user_id = current_user.id
    if @vegetainable_review.save
      flash[:notice] = "★ レビューが投稿されました！"
      redirect_to vegetainable_reviews_path
    else
      render :new
    end

  end

  def edit
    @vegetainable_review = VegetainableReview.find(params[:id])
  end

  def update
    vegetainable_review = VegetainableReview.find(params[:id])
    vegetainable_review.update(vegetainable_review_params)
    redirect_to vegetainable_review_path(vegetainable_review.id)
  end

  def destroy
    @vegetainable_review = VegetainableReview.find(params[:id])
    @vegetainable_review.destroy
    redirect_to vegetainable_reviews_path, notice: '★ レビューが１件削除されました！'
  end

  private

  def vegetainable_review_params
    params.require(:vegetainable_review).permit(:title, :name, :price, :amount, :farmer_name, :user_id, :shop_name, :image, :caption, :area, tag_ids: [])
  end

end
