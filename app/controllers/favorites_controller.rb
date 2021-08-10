class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.save
    redirect_to shop_path(@favorite.shop_id)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, shop_id: params[:shop_id])
    @favorite.destroy
    redirect_to shop_path(@favorite.shop_id)
  end

  private
  def favorite_params
    params.permit(:user_id, :shop_id).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end

end
