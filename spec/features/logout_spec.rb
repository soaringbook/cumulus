require 'rails_helper.rb'

describe 'The logout flow', type: :feature do
  before do
    login_as_pilot
    visit root_path
  end

  it 'should log out' do
    click_link 'Logout'

    expect(page).to have_content('Sign in')
  end
end
