class Chat < ApplicationRecord
  belongs_to :sale
  has_many :messages
end
