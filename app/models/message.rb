class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :content, presence: { message: "El mensaje no puede estar vacío" }
  after_validation :report_validation_errors_to_rollbar

end
