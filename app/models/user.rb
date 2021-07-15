class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]


          with_options presence: true do
            validates :nickname
            validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
            validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥ー]+\z/ }
            validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥ー]+\z/ }
            validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
            validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
            validates :birth_date
            end
            validates :encrypted_password,:password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
      
              has_many :reviews, dependent: :destroy
              has_many :sns_credentials

              extend ActiveHash::Associations::ActiveRecordExtensions
              belongs_to :prefecture

              def self.from_omniauth(auth)
                sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
                user = User.where(email: auth.info.email).first_or_initialize(
                  nickname: auth.info.name,
                    email: auth.info.email
                )

                if user.persisted?
                  sns.user = user
                  sns.save
                end
                { user: user, sns: sns }
              end
      end
