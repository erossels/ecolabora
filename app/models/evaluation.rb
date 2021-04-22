class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :purchase

  validates :grade, numericality: { message: "%{value} no es correcto" }, :inclusion => 1..5
end
