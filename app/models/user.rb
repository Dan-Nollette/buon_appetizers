class User < ApplicationRecord
  has_many :comments
  validates :name, :presence => true
  validates :email, :presence => true
  validates :is_admin, :presence => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
