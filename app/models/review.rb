class Review < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :content
  end

  belongs_to :user
  belongs_to :shop

end
