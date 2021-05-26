class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :purchase, optional: true
  has_many_attached :photos

  enum status: [ :Disponible, :Vendida ]
  enum r_action: [ :Reducir, :Reutilizar, :Reciclar]

  scope :available, -> {where('status = 0')}
  scope :sold, -> { where('status = 1') }
  scope :local, -> (user) {joins(:user).where("users.province = ?", "%#{user.province}%")}

  validates :name, presence: {message: 'El producto debe tener un título'}
  validates :description, presence: {message: 'El producto debe tener una descripción'}
  validates :r_action, presence: {message: 'El producto debe tener asociada una acción'}

  after_validation :report_validation_errors_to_rollbar

  def update_status(n)
    self.status = n
    self.save
  end

end
