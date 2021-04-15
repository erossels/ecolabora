class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :chat
end
