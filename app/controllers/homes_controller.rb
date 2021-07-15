class HomesController < ApplicationController
  
  def index
    @shops =Shop.all
    @p = Shop.ransack(params[:q])
    @q = Shop.ransack(params[:q])
  end

end

