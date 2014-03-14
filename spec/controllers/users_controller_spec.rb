require 'spec_helper'

describe UsersController do
  let(:user){}

  it 'Should redirect to homepage' do
      visit '/users/sign_up'

      fill_in 'user_first_name', with: 'test'
      fill_in 'user_last_name', with: 'me'
      fill_in 'user_email', with: 'email@aol.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button('Sign up')
      expect(page).to have_content "Welcome! You have signed up successfully."

  end

  it  'Should be able to sign in' do
    user = User.create!(first_name: "Test", last_name: "Icle", email: "test@aol.com", password: "password", password_confirmation: "password")
    visit '/users/sign_in'

    fill_in 'user_email', with: "test@aol.com"
    fill_in 'user_password', with: "password"

    click_button('Sign in')
    expect(page).to have_content 'Signed in successfully'
  end
end
