class Theme < ApplicationRecord
  has_one_attached :image
  
  belongs_to :user
  has_many :opinions
end
