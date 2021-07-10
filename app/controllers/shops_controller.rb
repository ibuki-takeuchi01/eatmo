class ShopsController < ApplicationController

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
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :genre_id, :phone, :prefecture_id, :address, :traffic, :operating_hours, :budget_id, :seat, :other, :video, images: []).merge(owner_id: current_owner.id)
  end
end
