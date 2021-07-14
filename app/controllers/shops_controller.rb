class ShopsController < ApplicationController
  before_action :set_shop, only: [:show,:edit,:update,:destroy]

  def index
    @shops = Shop.includes(:owner).order(created_at: :desc)
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @review = Review.new
    @reviews = @shop.reviews
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to shop_path
    else
      render :edit
    end
  end

  def destroy
    if @shop.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :genre_id, :phone, :prefecture_id, :address, :traffic, :operating_hours, :budget_id, :seat, :other, :video, images: []).merge(owner_id: current_owner.id)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

end
