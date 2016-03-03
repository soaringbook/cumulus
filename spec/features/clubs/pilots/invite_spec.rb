require 'rails_helper.rb'

describe 'The club pilots invite flow', type: :feature do
  before do
    clear_emails
    login_as_pilot create(:pilot, super_admin: true)

    club = create(:club)
    visit edit_club_path(club)
    click_link 'Invite pilot'
  end

  it 'should see the invite form', js: true do
    expect(page).to have_content('First name')
  end

  it 'should successfully invite a pilot', js: true do
    fill_in 'Email', with: 'jake@snake.be'
    fill_in 'First name', with: 'Jake'
    fill_in 'Last name', with: 'Snake'
    click_button 'Invite pilot'

    sleep 1 # Fix for triggering email from JS.
    open_email('jake@snake.be')
    expect(current_email).to have_content 'Confirm'
  end

  it 'should fail to invite a pilot', js: true do
    fill_in 'Email', with: 'jake@snake.be'
    click_button 'Invite pilot'

    sleep 1 # Fix for triggering email from JS.
    open_email('jake@snake.be')
    expect(current_email).to be_nil
    expect(page).to have_content('Email')
  end
end
