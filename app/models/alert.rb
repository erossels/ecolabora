class Alert < ApplicationRecord
  belongs_to :user
  validates :content, presence: {message: 'La alerta debe tener al menos una palabra'}
end
