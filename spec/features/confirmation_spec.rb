require 'rails_helper.rb'

describe 'The confirmation flow', type: :feature do
  # before do
  #   clear_emails
  #   create_club
  #   open_email('jake@snake.be')
  # end
  #
  # it 'should confirm a user' do
  #   current_email.click_link 'Confirm'
  #   expect(page).to have_content('Activate your club')
  #
  #   fill_in 'First name',            with: 'Jake'
  #   fill_in 'Last name',             with: 'Snake'
  #   fill_in 'Password',              with: '123123123', match: :prefer_exact
  #   fill_in 'Password confirmation', with: '123123123', match: :prefer_exact
  #   click_button 'Continue'
  #
  #   expect(page).to have_content('Your email address has been successfully confirmed')
  #   expect(Pilot.first.confirmed_at).to_not be_nil
  # end
  #
  # it 'should fail to confirm a user' do
  #   current_email.click_link 'Confirm'
  #   expect(page).to have_content('Activate your club')
  #
  #   click_button 'Continue'
  #
  #   expect(page).to have_content('Activate your club')
  #   expect(Pilot.first.confirmed_at).to be_nil
  # end
  #
  # it 'should fail to confirm a user when the password is invalid' do
  #   current_email.click_link 'Confirm'
  #   expect(page).to have_content('Activate your club')
  #
  #   fill_in 'First name', with: 'Jake'
  #   fill_in 'Last name',  with: 'Snake'
  #   click_button 'Continue'
  #
  #   expect(page).to have_content('Activate your club')
  #   expect(Pilot.first.confirmed_at).to be_nil
  # end
  #
  # it 'should get a 404 error' do
  #   visit '/club/confirmation'
  #   expect(page).to have_content('Not found')
  # end
  #
  # private
  #
  # def create_club
  #   visit new_pilot_registration_path
  #
  #   fill_in 'Club abbreviation (ex. BZC)', with: 'ebbt'
  #   fill_in 'Email',                       with: 'jake@snake.be'
  #   click_button 'Create yours'
  # end
end
