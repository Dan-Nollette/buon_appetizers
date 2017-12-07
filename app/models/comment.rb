class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :text_body, :presence => true
  validates :user_id, :presence => true
  validates :product_id, :presence => true
end
