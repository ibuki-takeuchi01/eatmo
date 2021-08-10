class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @nickname = current_user.nickname
    @image = current_user.image
    @profile = current_user.profile
    @prefecture = current_user.prefecture.name
  end

  def favorite
    @shop = Shop.find(params[:shop_id])
    @favorites = current_user.favorites

  end

  private

  def user_params
    params.require(:user).permit(:nickname, :prefecture_id, :last_name, :first_name_kana, :last_name_kana, :first_name_kana, :profile, :image, :birth_date)
  end
end