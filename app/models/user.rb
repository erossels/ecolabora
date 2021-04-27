class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_many :alerts, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_one_attached :avatar
  has_many :evaluations, through: :purchases, dependent: :destroy
  ratyrate_rater

  def to_s
    first_name
  end

  #omniauth Facebook
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.avatar = auth.info.image
      parse_name(user, auth.info.name)
    end
  end

  private
  def self.parse_name(user, name)
    name_arr = name.split(" ")
    user.last_name = name_arr.pop
    user.first_name = name_arr.join(" ")
  end

end
