require 'rails_helper'
require 'capybara'

feature 'homepage' do
  scenario 'there is a homepage' do
    visit "/"
    expect(page).to have_content('Rantly')
  end

  scenario 'can register' do
    user_register
    expect(page).to have_content 'Thank you for registering'
  end

  scenario 'can login' do
    user_login
    expect(page).to have_content 'Hi, cam'
  end

  scenario 'can logout' do
    user_login
    click_on 'Signout'
    visit '/'
  end

  scenario 'can edit user profile' do
    user_login
    click_on 'Edit Profile'
    fill_in 'user_username', with: 'cam'
    fill_in 'user_password', with: 'jam'
    fill_in 'user_first_name', with: 'cam'
    fill_in 'user_last_name', with: 'buckingham'
    fill_in 'user_bio', with:  'gschool'
    fill_in 'user_image', with: 'https://students-gschool-production.s3.amazonaws.com/uploads/user/avatar/61/IMG_6029.JPG'
    click_button 'Update profile'
    expect(page).to have_content 'Your profile was successfully updated!'
  end

  scenario 'user can see a rant page' do
    user_login
    click_on "cam's Dashboard"
    expect(page).to have_content "Your Rants"
  end

  scenario 'create a rant' do
    create_rant
    expect(page).to have_content "Rant created successfully!"

  end
  scenario 'delete a rant' do
    create_rant
    click_on 'delete'
    expect(page).to have_content "Your rants was deleted!"
  end

  def user_register
    visit '/'
    click_link 'Join'
    fill_in 'user_username', with: 'cam'
    fill_in 'user_password', with: 'jam'
    fill_in 'user_first_name', with: 'cam'
    fill_in 'user_last_name', with: 'buckingham'
    fill_in 'user_bio', with:  'gschool'
    fill_in 'user_image', with: 'https://students-gschool-production.s3.amazonaws.com/uploads/user/avatar/61/IMG_6029.JPG'
    click_button 'Register'
  end

  def user_login
    user_register
    visit '/signin'
    click_on 'Login'
    fill_in 'user_username', with: 'cam'
    fill_in 'user_password', with: 'jam'
  end

  def create_rant
    user_login
    click_on "cam's Dashboard"
    click_on 'create rants'
    fill_in 'rant_title', with: 'airlines'
    fill_in 'rant_content', with: 'american airlines is the best'
    click_on 'Create rants'
  end
end