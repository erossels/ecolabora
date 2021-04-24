class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :alerts, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_one_attached :avatar
  has_many :evaluations, through: :purchases, dependent: :destroy

  def to_s
    first_name
  end
end
