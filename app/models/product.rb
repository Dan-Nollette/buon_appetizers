class Product < ApplicationRecord
  has_many :comments
  validates :name, :presence => true
  validates :description, :presence => true
  validates :price, :presence => true
end
