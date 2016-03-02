require 'rails_helper.rb'

describe 'The club list flow', type: :feature do
  before { login_as_pilot create(:pilot, super_admin: true) }

  it 'should see a list with clubs' do
    create(:club)
    visit clubs_path

    expect(page).to_not have_content('No clubs found')
    expect(page).to have_css('tbody tr', count: 2)
  end

  it 'should be able to search the clubs', js: true do
    create(:club, short_name: 'abcd')
    create(:club, short_name: 'abd')
    visit clubs_path

    fill_in 'Search for clubs...', with: 'bc'
    press_enter '#search'

    expect(page).to have_css('tbody tr', count: 1)
  end

  it 'should be able to search the clubs', js: true do
    create(:club, short_name: 'Nam')
    create(:club, short_name: 'Noo')
    create(:club, short_name: 'Nama')
    create(:club, short_name: 'Noa')
    visit clubs_path

    fill_in 'Search for clubs...', with: 'NA'
    press_enter '#search'

    expect(page).to have_css('tbody tr', count: 2)
  end
end
