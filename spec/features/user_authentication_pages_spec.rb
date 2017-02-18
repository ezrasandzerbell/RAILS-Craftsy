require 'rails_helper'

describe "create User and login" do
  it "adds a user and logs in" do
    visit '/'
    click_on 'Signup'
    fill_in 'Email', :with => 'test@email.com'
    fill_in 'Name', :with => 'Franz'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content 'test@email.com'
  end
end
