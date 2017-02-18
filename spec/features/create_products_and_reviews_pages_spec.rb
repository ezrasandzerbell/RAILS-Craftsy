require 'rails_helper'

describe "Create Products" do
  it "Create and View Product" do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', :with => 'test@email.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    visit '/products'
    find('.bigLink').click
    fill_in 'Product Name', :with => 'Hat'
    fill_in 'Product Details', :with => 'Made of Felt'
    fill_in 'Product Cost', :with => '$25.00'
    page.attach_file("Image File", 'spec/fixtures/images/hat.jpg')
    click_on 'Create Product'
    find(".thisImage").click
    expect(page).to have_content 'Hat'
  end
end


describe "CRUD Products" do
  it "Edit Product" do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', :with => 'test@email.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    visit '/products'
    find('.bigLink').click
    fill_in 'Product Name', :with => 'Hat'
    fill_in 'Product Details', :with => 'Made of Felt'
    fill_in 'Product Cost', :with => '$25.00'
    page.attach_file("Image File", 'spec/fixtures/images/hat.jpg')
    click_on 'Create Product'
    click_on 'info_outline'
    click_on 'Edit Product'
    fill_in 'Product Name', :with => 'Big Hat'
    click_on 'Update Product'
    expect(page).to have_content 'Big Hat'
  end

  it "Delete Product" do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', :with => 'test@email.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    visit '/products'
    find('.bigLink').click
    fill_in 'Product Name', :with => 'Hat'
    fill_in 'Product Details', :with => 'Made of Felt'
    fill_in 'Product Cost', :with => '$25.00'
    page.attach_file("Image File", 'spec/fixtures/images/hat.jpg')
    click_on 'Create Product'
    click_on 'info_outline'
    click_on 'Delete Product'
    expect(page).to have_content 'Create New Product'
  end
end


describe "Reviews" do
  it "Add Review" do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', :with => 'test@email.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    visit '/products'
    find('.bigLink').click
    fill_in 'Product Name', :with => 'Hat'
    fill_in 'Product Details', :with => 'Made of Felt'
    fill_in 'Product Cost', :with => '$25.00'
    page.attach_file("Image File", 'spec/fixtures/images/hat.jpg')
    click_on 'Create Product'
    click_on 'info_outline'
    click_on 'Add a review'
    fill_in 'Review Title', :with => 'Pretty Great'
    fill_in 'Write about the product here', :with => 'I would wear this to a party'
    click_on 'Create Review'
    expect(page).to have_content 'Pretty Great'
  end
  it "Delete Review" do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', :with => 'test@email.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    visit '/products'
    find('.bigLink').click
    fill_in 'Product Name', :with => 'Hat'
    fill_in 'Product Details', :with => 'Made of Felt'
    fill_in 'Product Cost', :with => '$25.00'
    page.attach_file("Image File", 'spec/fixtures/images/hat.jpg')
    click_on 'Create Product'
    click_on 'info_outline'
    click_on 'Add a review'
    fill_in 'Review Title', :with => 'Pretty Great'
    fill_in 'Write about the product here', :with => 'I would wear this to a party'
    click_on 'Create Review'
    click_on 'Delete Review'
    expect(page).to_not have_content 'Pretty Great'
  end
end
