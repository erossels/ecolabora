class Purchase < ApplicationRecord
  belongs_to :user
  has_one :product
  has_one :user, through: :product
  has_one :chat
  has_one :evaluation

  enum status: [ :creada, :cancelada, :hecha ] 

end
