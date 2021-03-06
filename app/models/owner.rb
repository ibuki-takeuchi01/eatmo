class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        with_options presence: true do
          validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥ー]+\z/ }
          validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥ー]+\z/ }
          validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
          validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
          validates :personal_phone, format: {with: /\A\d{10}\z|\A\d{11}\z/}
          validates :shop_name
        end
        validates :encrypted_password,:password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
  
        has_one :shop
  end
