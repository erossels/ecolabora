class Alert < ApplicationRecord
  belongs_to :user
  validates :content, presence: {message: 'La alerta debe tener al menos una palabra'}
  after_validation :report_validation_errors_to_rollbar
end
