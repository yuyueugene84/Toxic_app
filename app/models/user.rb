class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :brands
  has_many :products
  has_many :ingredients

 # extend OmniauthCallbacks


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
