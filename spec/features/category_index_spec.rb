require 'rails_helper'

RSpec.feature 'Categories Index', type: :feature do
  before(:each) do
    User.delete_all
    Category.delete_all
    @user = User.create(
      name: 'john',
      email: 'john@example.com',
      password: 'password',
      confirmed_at: Time.now
    )
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit categories_path
  end
  scenario 'visiting the content of this page' do
    visit categories_path
    expect(page).to have_content('Categories')
  end

  scenario 'user should not expect this' do
    visit categories_path
    expect(page).not_to have_content('Categoryy')
  end
  scenario 'user should expect to see' do
    expect(page).to have_content('Sign Out')
  end
  scenario 'user should not expect to see' do
    expect(page).not_to have_content('Sign In')
  end
  scenario 'user should expect to have a link' do
    expect(page).to have_link('Sign Out')
  end
  scenario 'user should not expect to have this link' do
    expect(page).not_to have_link('Sign In')
  end
  scenario 'user should not expect to have button' do
    expect(page).not_to have_button('Sign Out')
  end
  scenario 'should expect to see a css content' do
    expect(page).to have_css('.nav-link')
  end
  scenario 'should not expect to see a css content' do
    expect(page).not_to have_css('#nav-link')
  end
  scenario 'should expect to see a tag "strong"' do
    expect(page).to have_css('strong')
  end
  scenario 'should not expect to see a tag "image_tag"' do
    expect(page).not_to have_css('image_tag')
  end

  scenario 'should expect to see a content "New Category"' do
    expect(page).to have_content('New Category')
  end
  scenario 'should not expect to see a content "Add New Category"' do
    expect(page).not_to have_content('Add New Category')
  end
  scenario 'it should have the css element' do
    expect(page).to have_css('button')
  end
  scenario 'it should not have the css element like this' do
    expect(page).not_to have_css('link')
  end

  scenario 'When sign out, it should redirect to the right path' do
    visit root_path
    expect(page).to have_current_path(root_path)
  end
end
