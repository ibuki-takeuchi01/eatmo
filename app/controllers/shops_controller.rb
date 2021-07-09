class ShopsController < ApplicationController

  def index
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

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :genre_id, :phone, :prefecture_id, :address, :traffic, :operating_hours, :budget_id, :seat, :other, :video, images: []).merge(operation_id: current_user.id, owner_id: current_user.id)
  end
end
