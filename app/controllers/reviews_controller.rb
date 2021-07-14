class ReviewsController < ApplicationController
  def index
    @review = Review.new
    @shop = Shop.find(params[:shop_id])
    @reviews = @shop.reviews.includes(:user)
  end

  def new
    @shop = Shop.find(params[:shop_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to homes_path(@review.shop)
    else
      @shop = @review.shop
      @reviews = @shop.reviews.includes(:user)
      render "shops/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :rate, :content).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end

end
