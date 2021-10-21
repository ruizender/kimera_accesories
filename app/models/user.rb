class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, 
          :omniauthable, omniauth_providers: %i[facebook]
  validates :name, :lastname, :address, :rut, :phone, presence: true
  ratyrate_rater
end
