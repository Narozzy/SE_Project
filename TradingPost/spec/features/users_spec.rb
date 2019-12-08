require 'rails_helper'

RSpec.feature "Users", type: :feature do
  let(:user) { User.last }
  context 'create new user' do
    scenario 'should be successful' do
      visit sign_up_path
      expect(page).to have_content('Sign up')
      fill_in 'user[email]', with: 'some@email.edu'
      fill_in 'user[password]', with: 'some_password'
      # Since we have a default value for major, we need not set it
      click_button 'commit'
    end
    scenario 'should fail' do
      visit sign_up_path
      expect(page).to have_content('Sign up')
      fill_in 'user[email]', with: 'some@email.edu'
      click_button 'commit'
    end
  end

  context 'create new listing' do
    scenario 'user creates a listing' do
      visit listings_path(as: user)
      expect(page).to have_content('Listings')
      page.has_css?('.button')
      click_button 'create_listing_btn'
      expect(page).to have_content('Create New Listing')
      fill_in 'listing[title]', with: 'Example Listing'
      click_button 'commit'
      expect(page).to have_content('Listing Information')
      expect(page).to have_content('Title: Example Listing')
    end
  end

  context 'view listing' do
    scenario 'user should see a listing' do
      visit listings_path(as: user)
      expect(page).to have_content('Listings')
      expect(page).to have_content('Test Booklet')
      find_by_id('image_Test Booklet').click()
      expect(page).to have_content('Test Booklet')
      expect(page).to have_content('book')
    end

    scenario 'message user from listing' do
      #Passing in parameters that would be on the page of listing
      visit new_message_path(listing_id: 4, from_id: 2, to_id: 2, as: user)
      expect(page).to have_content('New Message')
      expect(page).to have_content('Content')
      fill_in 'message[content]', with: 'Some Example Text for Message'
      click_button 'commit'
      expect(page).to have_content('For Listing:')
    end

    scenario 'search for listings' do
      # Simulate a user searching for desired listings
      visit listings_path(as: user)
      expect(page).to have_content('Listings')
      expect(page).to have_css('input')
      fill_in 'listing', with: 'Hardware\n' # \n is interpretted as pressing "Enter"
      expect(page).to have_content('Great Laptop For CS Students')
    end
  end

  context 'view messages' do
    scenario 'check messages' do
      visit messages_path(as: user)
      expect(page).to have_content('All Messages')
      expect(page).to have_content('Received Messages:')
      expect(page).to have_content('Sent Messages:')
      click_link 'From:'
      expect(page).to have_content("Between #{user.email} and #{user.email}")
      expect(page).to have_content('For Listing:')
      expect(page).to have_content('Reply')
    end

    scenario 'reply from message' do
      visit message_path(as: user, id: 2)
      click_link 'Reply'
      expect(page).to have_content('Content')
      expect(page).to have_css('textarea')
      fill_in 'message[content]', with: 'Some Example Text'
      click_button 'commit'
      expect(page).to have_content('For Listing:')
    end
  end
end
