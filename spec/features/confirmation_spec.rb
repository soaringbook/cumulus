require 'rails_helper.rb'

describe 'The confirmation flow', type: :feature do
  before do
    clear_emails
    create_club
    open_email('jake@snake.be')
  end

  it 'should confirm a user' do
    current_email.click_link 'Confirm'
    expect(page).to have_content('Activate your club')

    fill_in 'First name',            with: 'Jake'
    fill_in 'Last name',             with: 'Snake'
    fill_in 'Password',              with: '123123123', match: :prefer_exact
    fill_in 'Password confirmation', with: '123123123', match: :prefer_exact
    click_button 'Continue'

    expect(page).to have_content('Welcome to Soaring Book')
    expect(Pilot.first.confirmed_at).to_not be_nil
  end

  it 'should fail to confirm a user' do
    current_email.click_link 'Confirm'
    expect(page).to have_content('Activate your club')

    click_button 'Continue'

    expect(page).to have_content('Activate your club')
    expect(Pilot.first.confirmed_at).to be_nil
  end

  it 'should fail to confirm a user when the password is invalid' do
    current_email.click_link 'Confirm'
    expect(page).to have_content('Activate your club')

    fill_in 'First name', with: 'Jake'
    fill_in 'Last name',  with: 'Snake'
    click_button 'Continue'

    expect(page).to have_content('Activate your club')
    expect(Pilot.first.confirmed_at).to be_nil
  end

  it 'should get a 404 error' do
    visit '/club/confirmation'
    expect(page).to have_content('Not found')
  end

  private

  def create_club
    pilot = build(:pilot, first_name: 'Jake', last_name: 'The Snake', email: 'jake@snake.be', confirmed_at: nil, password: nil, password_confirmation: nil)
    pilot.club = build(:club)
    pilot.save!
  end
end
