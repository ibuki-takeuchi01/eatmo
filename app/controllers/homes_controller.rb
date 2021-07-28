class HomesController < ApplicationController
  
  def index
    @shop = Shop.new
    @shops = Shop.includes(:owner).order(created_at: :desc)
    @reviews = Review.includes(:user).order(created_at: :desc)
    @p = Shop.ransack(params[:q])
    @q = Shop.ransack(params[:q])
  end

end

