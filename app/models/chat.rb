class Chat < ApplicationRecord
  belongs_to :purchase
  has_many :messages, dependent: :destroy
end
