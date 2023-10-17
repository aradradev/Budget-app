require 'rails_helper'

RSpec.feature 'Splash/Index', type: :feature do
  before(:each) do
    User.create!(
      name: 'John',
      email: 'john@gmail.com',
      password: 'password',
      confirmed_at: Time.now
    )
    visit root_path
  end
  scenario 'Where User can see the Title' do
    expect(page).to have_content('Welcome! to Budget Monitor')
  end
  scenario 'Where User cannot see the Title like this' do
    expect(page).not_to have_content('Welcome!<br> to Budget Monitor')
  end
  scenario 'Where User can see the content' do
    expect(page).to have_content('Your personal budget tracking app')
  end
  scenario 'Where User cannot see the content like this' do
    expect(page).not_to have_content('Your personal budget "tracking app"')
  end
  scenario 'Where User can see the button "Sign in"' do
    expect(page).to have_content('Sign in')
  end
  scenario 'Where User can see the button "Sign up"' do
    expect(page).to have_content('Sign up')
  end
  scenario 'Where User cannot see the button like this' do
    expect(page).not_to have_content('Start Monitoring')
  end
  scenario 'Where User can click to the button to "sign in"' do
    expect(page).to have_button('Sign in')
  end
  scenario 'Where User cannot see the button to "sign in"' do
    expect(page).not_to have_button('Sign In')
  end
  scenario 'Where User cannot click to the button and redirect' do
    expect(page).not_to have_button('Start Monitoring')
  end
  scenario 'Where it redirects to the correct sign in path' do
    visit '/users/sign_in'
    expect(page).to have_current_path('/users/sign_in')
  end
  scenario 'Where it does not redirect to the correct sign in path' do
    visit '/users/sign_in'
    expect(page).not_to have_current_path('/users/sign_up')
  end
  scenario 'Where it redirects to the correct sign up path' do
    visit '/users/sign_up'
    expect(page).to have_current_path('/users/sign_up')
  end
  scenario 'Where it does not redirect to the correct sign in path' do
    visit '/users/sign_up'
    expect(page).not_to have_current_path('/users/sign_in')
  end
end
