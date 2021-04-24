class Region < ApplicationRecord
  has_many :counties, dependent: :destroy

  def to_s
    name
  end 
end
