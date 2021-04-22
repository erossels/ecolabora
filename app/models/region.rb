class Region < ApplicationRecord
  has_many :counties

  def to_s
    name
  end 
end
