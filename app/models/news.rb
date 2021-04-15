class News < ApplicationRecord
  belongs_to :admin
  has_one_attached :photo
end
