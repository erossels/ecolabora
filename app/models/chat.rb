class Chat < ApplicationRecord
  belongs_to :sales
  has_many :messages
end
