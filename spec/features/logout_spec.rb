require 'rails_helper.rb'

describe 'The logout flow', type: :feature do
  before { 
    login_as create(:pilot) 
    visit root_path
  }
  
  it 'should log out' do
    click_link 'Logout'

    expect(page).to have_content('Log in')
  end
end
