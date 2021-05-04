class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :news
  validates :email, :uniqueness => { :case_sensitive => false }
  after_validation :report_validation_errors_to_rollbar

end
