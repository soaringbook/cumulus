require 'rails_helper.rb'

describe 'The account flow', type: :feature do
  before { login_as_pilot }

  it 'should show the account payment tab' do
    visit edit_account_path

    expect(page).to have_content(@pilot.club.short_name)
    expect(page).to have_content('Edit club account')
  end
end
