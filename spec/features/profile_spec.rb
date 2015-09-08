require 'rails_helper.rb'

describe 'The profile flow', type: :feature do
  before do
    @pilot = create(:pilot)
    login_as(@pilot, scope: :pilot)
  end

  it 'should show the profile' do
    visit profile_path

    expect(page).to have_content(@pilot.first_name)
    expect(page).to have_content('Your profile')
  end

  it 'should edit the profile' do
    visit edit_profile_path

    fill_in 'First name', with: 'Jake'
    within '#profile' do
      click_button 'Update Pilot'
    end

    expect(page).to have_content('Profile is successfully updated.')
    expect(Pilot.first.first_name).to eq('Jake')
  end

  it 'should fail to edit the profile' do
    visit edit_profile_path

    fill_in 'First name', with: ''
    within '#profile' do
      click_button 'Update Pilot'
    end

    expect(page).to have_content('can\'t be blank')
  end

  it 'should edit the password' do
    visit edit_profile_path(tab: 'security')

    fill_in 'Password', with: '123123123'
    fill_in 'Password confirmation', with: '123123123'
    within '#security' do
      click_button 'Update Pilot'
    end

    expect(page).to have_content('Profile is successfully updated.')
  end

  it 'should fail to edit the password' do
    visit edit_profile_path(tab: 'security')

    fill_in 'Password', with: ''
    within '#security' do
      click_button 'Update Pilot'
    end

    expect(page).to have_content('can\'t be blank')
  end

  it 'should edit the settings' do
    visit edit_profile_path(tab: 'settings')

    within '#settings' do
      click_button 'Update Pilot'
    end

    expect(page).to have_content('Profile is successfully updated.')
  end
end
