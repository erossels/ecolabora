class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :content, presence: { message: "El mensaje no puede estar vacío" }

end
