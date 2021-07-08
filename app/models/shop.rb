class Shop < ApplicationRecord

  with_options presence: true do
    validates :images
    validates :shop_name
    validates :genre_id
    validates :phone,  format: {with: /\A\d{10}\z|\A\d{11}\z/}
    validates :prefecture_id
    validates :traffic
    validates :operating_hours
    validates :budget_id
    validates :seat
    end
  
    belongs_to :owner
    belongs_to :operation
    has_many :reviews
    has_one_attached :image
end
