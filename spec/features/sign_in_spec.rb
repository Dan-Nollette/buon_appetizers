require 'rails_helper'

describe "sign up successfully" do

  it "adds a new product" do
    FactoryBot.create(:user)
    visit products_path
    click_link 'Log In'
    fill_in 'user_email', :with => 'fake@email.com'
    fill_in 'user_password', :with => 'password'
    click_button("Log in")
    expect(page).to have_content 'Buon Appétizers'
  end
end
