class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one :transaction
  has_many_attached :photos
end
