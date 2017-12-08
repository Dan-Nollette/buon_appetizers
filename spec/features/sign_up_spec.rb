require 'rails_helper'

describe "sign up successfully" do
  it "adds a new product" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_email', :with => 'fake@email.com'
    fill_in 'user_password', :with => 'password'
    fill_in 'user_password_confirmation', :with => 'password'
    click_button("Sign up")
    expect(page).to have_content 'Buon Appétizers'
  end
end
