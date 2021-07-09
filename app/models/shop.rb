class Shop < ApplicationRecord

  with_options presence: true do
    validates :images
    validates :shop_name
    validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"} 
    validates :phone,  format: {with: /\A\d{10}\z|\A\d{11}\z/}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :traffic
    validates :operating_hours
    validates :budget_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :seat
    end
  
    belongs_to :owner
    belongs_to :operation
    has_many :reviews
    has_many_attached :images
    has_one_attached :video

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :genre
    belongs_to :prefecture
    belongs_to :budget
end
