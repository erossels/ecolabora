class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one :sale
  has_many_attached :photos
end
