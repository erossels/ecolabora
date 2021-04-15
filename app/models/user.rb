class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :alerts
  has_many :products
  has_many :transactions
  has_many :chats, through: :transaction
  has_one_attached :avatar
end
