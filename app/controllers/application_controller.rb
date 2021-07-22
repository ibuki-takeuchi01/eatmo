class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :prefecture_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :profile, :image, :company, :shop_name, :personal_phone, :birth_date])
  end
end
