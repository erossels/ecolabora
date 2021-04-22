class County < ApplicationRecord
  belongs_to :region

  def to_s
    name
  end
end
