class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one :sale
  has_many_attached :photos

  validates :name, presence: {message: 'El producto debe tener un título'}
  validates :description, presence: {message: 'El producto debe tener una descripción'}
  validates :r_action, presence: {message: 'El producto debe tener asociada una acción'}
  
end
