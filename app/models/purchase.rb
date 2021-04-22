class Purchase < ApplicationRecord
  belongs_to :user
  has_one :product
  has_one :user, through: :product
  has_one :chat
  has_many :evaluations

  scope :pending, -> { where('status = 1') }
  scope :done, -> { where('status = 2') }
  
  enum status: [ :creada, :cancelada, :hecha ] 

end
