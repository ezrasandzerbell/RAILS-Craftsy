class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :timeoutable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products

end
