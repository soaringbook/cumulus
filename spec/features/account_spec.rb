require 'rails_helper.rb'

describe 'The account flow', type: :feature do
  before { login_as_pilot }

  it 'should show the account status tab' do
    visit edit_account_path
    expect(page).to have_content('Account status')
  end

  it 'should show the account settings tab' do
    visit edit_account_path(tab: 'settings')
    expect(page).to have_content('Abbreviation')
  end

  it 'should show the account settings tab on click', js: true do
    visit edit_account_path
    click_link 'Settings'
    expect(page).to have_content('Abbreviation')
  end

  it 'should edit the club account' do
    visit edit_account_path(tab: 'settings')

    fill_in 'Abbreviation', with: 'EBBT'
    click_button 'Update settings'

    expect(page).to have_content('Your club is successfully updated.')
    expect(Club.first.short_name).to eq('EBBT')
  end

  it 'should fail to edit the club account' do
    visit edit_account_path(tab: 'settings')

    fill_in 'Abbreviation', with: ''
    click_button 'Update settings'

    expect(page).to have_content('can\'t be blank')
  end
end
