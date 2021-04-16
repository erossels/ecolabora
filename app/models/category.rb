class Category < ApplicationRecord
  belongs_to :category, optional: true
  has_many :alerts
  has_many :products
  has_many :categories
end
