class Category < ApplicationRecord
  belongs_to :category
  has_many :alerts
  has_many :products
  has_many :categories
end
