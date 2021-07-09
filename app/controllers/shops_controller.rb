class ShopsController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  private

  def shop_params
    params.require(:shop).permit(:content, :images, :video).merge(user_id: current_user.id)
  end
end
