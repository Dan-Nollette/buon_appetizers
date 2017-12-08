require 'rails_helper'


describe "sign up successfully" do
  it "accesses the New Service page (restricted to logged in admins)" do
    user = FactoryBot.create(:user)
    user.is_admin = true
    user.save
    visit products_path
    click_link 'Log In'
    fill_in 'user_email', :with => 'fake@email.com'
    fill_in 'user_password', :with => 'password'
    click_button("Log in")
    click_link("New Service")
    expect(page).to have_content 'New Service Name Description Price'
  end

  it "adds a New Service" do
    user = FactoryBot.create(:user)
    user.is_admin = true
    user.save
    visit products_path
    click_link 'Log In'
    fill_in 'user_email', :with => 'fake@email.com'
    fill_in 'user_password', :with => 'password'
    click_button("Log in")
    click_link("New Service")
    fill_in 'product[name]', :with => 'thingamajig'
    fill_in 'product[description]', :with => 'Thoughts about the thing'
    fill_in 'product[price]', :with => '5'
    click_button("Create Product")
    expect(page).to have_content 'thingamajig'
  end
end
