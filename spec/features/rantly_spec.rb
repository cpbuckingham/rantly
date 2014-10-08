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
    expect(page).to have_content 'cam'
  end

  scenario 'can logout' do
    user_login
    click_on 'Logout'
    visit '/'
  end

  scenario 'can edit user profile' do
    user_login
    click_on "cam's Dashboard"
    click_link 'cam'
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
    expect(page).to have_content 'Your Rants'
  end

  scenario 'create a rant' do
    create_rant
    expect(page).to have_content 'Rant created successfully!'
  end

  scenario 'delete a rant' do
    create_rant
    click_on 'delete'
    expect(page).to have_content 'Your rants was deleted!'
  end

  scenario 'see another person rants' do
    another_persons_rant
    expect(page).to have_content 'american airlines is the best'
  end

  scenario 'follow another user' do
    another_persons_rant
    click_on 'cam'
    click_on 'Follow this Ranter'
    expect(page).to have_content 'Following'
    expect(page).to have_content 'cam'
  end

  scenario 'unfollow someone' do
    another_persons_rant
    click_on 'cam'
    click_on 'Follow this Ranter'
    expect(page).to have_content 'Following'
    expect(page).to have_link 'cam'
    click_on 'cam'
    click_on 'unfollow'
    expect(page).to have_content 'Following'
    expect(page).to_not have_content 'cam'
  end

  scenario 'seeing a users profile' do
    another_persons_rant
    click_on 'cam'
    expect(page).to have_content 'american airlines is the best'
  end

  scenario 'login errors' do
    user_register
    visit '/signin'
    click_on 'Login'
    fill_in 'user_username', with: 'cam'
    expect(page).to have_content 'Username / password is invalid'
  end

  scenario 'register errors' do
    visit '/'
    click_link 'Join'
    fill_in 'user_username', with: 'cam'
    fill_in 'user_first_name', with: 'cam'
    fill_in 'user_last_name', with: 'buckingham'
    fill_in 'user_bio', with:  'gschool'
    fill_in 'user_image', with: 'https://students-gschool-production.s3.amazonaws.com/uploads/user/avatar/61/IMG_6029.JPG'
    click_button 'Register'
    expect(page).to have_content "Password can't be blank"
  end

  scenario 'rant errors with no title' do
    user_login
    click_on "cam's Dashboard"
    fill_in 'rant_content', with: 'american airlines is the best'
    click_on 'create rant'
    expect(page).to have_content "Title can't be blank"
  end

  scenario 'rant errors with no content' do
    user_login
    click_on "cam's Dashboard"
    fill_in 'rant_title', with: 'airlines'
    click_on 'create rant'
    expect(page).to have_content "Content can't be blank"
  end

  scenario 'favoriting a rant' do
    another_persons_rant
    click_on 'Favorite'
    click_on 'Favorites'
    expect(page).to have_content 'american airlines is the best'
  end

  scenario 'unfavoriting a rant' do
    another_persons_rant
    click_on 'Favorite'
    click_on 'Favorites'
    click_on 'Unfavorite'
    expect(page).to_not have_content 'american airlines is the best'
  end

  scenario 'image is required to register' do
    visit '/'
    click_link 'Join'
    fill_in 'user_username', with: 'cam'
    fill_in 'user_password', with: 'jam'
    fill_in 'user_first_name', with: 'cam'
    fill_in 'user_last_name', with: 'buckingham'
    fill_in 'user_bio', with:  'gschool'
    click_button 'Register'
    expect(page).to have_content "Image can't be blank"
  end

  scenario 'search bar searches by username and all rants show' do
    another_persons_rant
    click_on 'Search'
    fill_in 'search', with: 'alex'
    click_on 'search'
    expect(page).to have_content 'greek food is the best'
  end

    scenario 'search bar searches by other username and all rants show' do
    another_persons_rant
    click_on 'Search'
    fill_in 'search', with: 'cam'
    click_on 'search'
    expect(page).to have_content 'american airlines is the best'
  end

  scenario 'search bar searches by last name and all rants show' do
    another_persons_rant
    click_on 'Search'
    fill_in 'search', with: 'mcritchie'
    click_on 'search'
    expect(page).to have_content 'greek food is the best'
  end

  scenario 'search bar searches by other user last name and all rants show' do
    another_persons_rant
    click_on 'Search'
    fill_in 'search', with: 'buckingham'
    click_on 'search'
    expect(page).to have_content 'american airlines is the best'
  end

  scenario 'search bar searches by first name and all rants show' do
    another_persons_rant
    click_on 'Search'
    fill_in 'search', with: 'alex'
    click_on 'search'
    expect(page).to have_content 'greek food is the best'
  end

  scenario 'search bar searches by other user first name and all rants show' do
    another_persons_rant
    click_on 'Search'
    fill_in 'search', with: 'cam'
    click_on 'search'
    expect(page).to have_content 'american airlines is the best'
  end

  scenario 'welcome back message is up for repeat visitors that have not registered' do
  visit '/'
  visit '/'
  expect(page).to have_content 'Welcome Back'
  end

  scenario 'bio page has rants ordered by most favorite' do
  another_persons_rant
  click_on 'Favorite'
  click_on 'cam'
  expect(page).to have_content 'Unfavorite | 1'
  end

  scenario 'search bar searches by content and all rants with that content show' do
    another_persons_rant
    click_on 'Search'
    fill_in 'search', with: 'american'
    click_on 'search'
    expect(page).to have_content 'american airlines is the best'
    expect(page).to have_link 'cam'
  end

  scenario 'search bar searches by content of other users and all rants with that content show' do
    another_persons_rant
    click_on 'Search'
    fill_in 'search', with: 'greek'
    click_on 'search'
    expect(page).to have_content 'greek food is the best'
    expect(page).to have_link 'alex'
  end


  scenario 'search bar searches by segments of content of all rants with that segment of content show' do
    another_persons_rant
    click_on 'Search'
    fill_in 'search', with: 'gre'
    click_on 'search'
    expect(page).to have_content 'greek food is the best'
    expect(page).to have_link 'alex'
  end

  scenario 'markdown parser works' do
    user_login
    click_on "cam's Dashboard"
    fill_in 'rant_title', with: 'markdown'
    fill_in 'rant_content', with: '##TEST'
    click_on 'create rant'
    expect(page).to have_content 'TEST'
  end

  scenario 'when a user is mentioned by another user, that user sees a section of rants where they are mentioned' do
    user_login
    click_on "cam's Dashboard"
    fill_in 'rant_title', with: 'airlines'
    fill_in 'rant_content', with: 'american airlines is the best, american airlines is the best, american airlines is the best, american airlines is the best, american airlines is the best, right @alex?'
    click_on 'create rant'
    click_on 'Logout'
    click_link 'Join'
    fill_in 'user_username', with: 'alex'
    fill_in 'user_password', with: '123'
    fill_in 'user_first_name', with: 'alex'
    fill_in 'user_last_name', with: 'mcritchie'
    fill_in 'user_bio', with:  'gschool'
    fill_in 'user_image', with: 'https://students-gschool-production.s3.amazonaws.com/uploads/user/avatar/61/IMG_6029.JPG'
    click_button 'Register'
    click_on "alex's Dashboard"
    expect(page).to have_content 'american airlines is the best, american airlines is the best, american airlines is the best, american airlines is the best, american airlines is the best, right @alex?'
    expect(page).to have_link 'cam'
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
    fill_in 'rant_title', with: 'airlines'
    fill_in 'rant_content', with: 'american airlines is the best, american airlines is the best, american airlines is the best, american airlines is the best, american airlines is the best'
    click_on 'create rant'
  end
  def another_persons_rant
    create_rant
    click_on 'Logout'
    click_link 'Join'
    fill_in 'user_username', with: 'alex'
    fill_in 'user_password', with: '123'
    fill_in 'user_first_name', with: 'alex'
    fill_in 'user_last_name', with: 'mcritchie'
    fill_in 'user_bio', with:  'gschool'
    fill_in 'user_image', with: 'https://students-gschool-production.s3.amazonaws.com/uploads/user/avatar/61/IMG_6029.JPG'
    click_button 'Register'
    click_on "alex's Dashboard"
    fill_in 'rant_title', with: 'food'
    fill_in 'rant_content', with: 'greek food is the best, greek food is the best, greek food is the best, greek food is the best, greek food is the best, greek food is the best, greek food is the best'
    click_on 'create rant'
  end
end