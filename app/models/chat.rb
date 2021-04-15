class Chat < ApplicationRecord
  belongs_to :transaction
  has_many :messages
end
