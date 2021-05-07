class Purchase < ApplicationRecord
  belongs_to :user
  has_one :product
  has_one :chat, dependent: :destroy
  has_many :evaluations, dependent: :destroy
  after_validation :report_validation_errors_to_rollbar

  scope :pending, -> { where('status = 0') }
  scope :done, -> { where('status = 2') }
  
  enum status: [ :Pendiente, :Cancelada, :Entregado ] 

  ratyrate_rateable "product", "user"

  def update_status(n)
    self.status = n
    self.save
  end

end
