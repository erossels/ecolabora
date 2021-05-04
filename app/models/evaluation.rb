class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :purchase

  validates :grade, numericality: { message: "%{value} no es correcto" }, :inclusion => 1..5
  after_validation :report_validation_errors_to_rollbar
end
