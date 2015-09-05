require 'rails_helper.rb'

describe 'The rights edit flow', type: :feature do
  before do
    @pilot = create(:pilot, admin: true)
    login_as(@pilot, scope: :pilot)
  end

  it 'should edit a pilot\'s rights' do
    visit edit_pilot_rights_path(@pilot)

    click_button 'Update Pilot'

    expect(page).to have_content('Access rights are successfully updated')
  end

  it 'should hide the sections part of the form' do
    pilot = create(:pilot, club: @pilot.club)
    visit edit_pilot_rights_path(pilot)

    check 'pilot_admin'

    expect(find(:css, '.section_access')['style']).not_to include('display: none')
  end

  it 'should show the sections part of the form' do
    pilot = create(:pilot, club: @pilot.club, admin: true)
    visit edit_pilot_rights_path(pilot)

    uncheck 'pilot_admin'

    expect(find(:css, '.section_access')['style']).to include('display: none')
  end
end
