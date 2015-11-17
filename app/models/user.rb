class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable,
  devise :database_authenticatable, 
  :recoverable, :rememberable, :trackable, :validatable, :registerable, :confirmable

  has_many :vote_translations
end
