require 'rails_helper'

describe Comment do
  it { should validate_presence_of :text_body }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :product_id }
end
