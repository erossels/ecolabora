class Purchase < ApplicationRecord
  belongs_to :user
  has_one :product
  has_one :chat, dependent: :destroy
  has_many :evaluations, dependent: :destroy

  scope :pending, -> { where('status = 0') }
  scope :done, -> { where('status = 2') }
  
  enum status: [ :creada, :cancelada, :hecha ] 

  ratyrate_rateable "product", "user"

end
