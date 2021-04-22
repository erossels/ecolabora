class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :purchase
  has_many_attached :photos

  enum status: [ :disponible, :vendida ] 

  scope :sold, -> { where('status = 1') }
  scope :local, -> { where("user_id = #{User.where(county: current_user.county, city:current_user.city)}")}

  validates :name, presence: {message: 'El producto debe tener un título'}
  validates :description, presence: {message: 'El producto debe tener una descripción'}
  validates :r_action, presence: {message: 'El producto debe tener asociada una acción'}
  
end
