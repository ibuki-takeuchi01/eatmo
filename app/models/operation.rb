class Operation < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

          with_options presence: true do
          validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥ー]+\z/ }
          validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥ー]+\z/ }
          validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
          validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
        end
        validates :encrypted_password,:password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
  
        has_many :reviews
        has_many :shops
  end
