class Category < ApplicationRecord
  belongs_to :category, optional: true
  has_many :alerts
  has_many :products
  has_many :categories

  validates :name, presence: { message: "La categoría debe llevar un nombre" }

  def to_s
    name
  end
end
