class Category < ApplicationRecord
  belongs_to :category, optional: true
  has_many :alerts, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: { message: "La categoría debe llevar un nombre" }
  after_validation :report_validation_errors_to_rollbar

  def to_s
    name
  end
end
