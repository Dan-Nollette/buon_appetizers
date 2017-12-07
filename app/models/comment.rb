class Comment < ApplicationRecord
  # belongs_to :user
  # temporarily cut out user so comment creation works, pending addition of authorization
  belongs_to :product
  validates :text_body, :presence => true
  # validates :user_id, :presence => true
  validates :product_id, :presence => true
end
