class ShopsController < ApplicationController

  private

  def shop_params
    params.require(:shop).permit(:content, :image).merge(user_id: current_user.id)
  end
end
