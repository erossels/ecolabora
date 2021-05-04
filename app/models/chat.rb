class Chat < ApplicationRecord
  belongs_to :purchase
  has_many :messages, dependent: :destroy
  after_validation :report_validation_errors_to_rollbar
end
