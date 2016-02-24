require 'rails_helper.rb'

describe 'The pilot list flow', type: :feature do
  before { login_as_pilot }

  it 'should see a list with pilots' do
    create(:pilot, club: @pilot.club)
    visit pilots_path

    expect(page).to_not have_content('No pilots found')
    expect(page).to have_css('tbody tr', count: 2)
  end

  it 'should download an xls with pilots' do
    create(:pilot, club: @pilot.club)
    visit pilots_path

    click_link 'Export to...'
    click_link 'Excel'

    expect(page.response_headers['Content-Type']).to eq('application/xls')
  end

  it 'should only see pilots from my club' do
    create(:pilot, club: @pilot.club)
    create(:pilot)
    visit pilots_path

    expect(page).to have_css('tbody tr', count: 2)
  end

  it 'should be able to search the pilots', js: true do
    create(:pilot, first_name: 'Name', club: @pilot.club)
    create(:pilot, first_name: 'No', club: @pilot.club)
    visit pilots_path

    fill_in 'Search for pilots...', with: 'Na'
    press_enter '#search'

    expect(page).to have_css('tbody tr', count: 1)
  end

  it 'should be able to search the pilots', js: true do
    create(:pilot, first_name: 'Nam', club: @pilot.club)
    create(:pilot, first_name: 'No', club: @pilot.club)
    create(:pilot, first_name: 'Nama')
    create(:pilot, first_name: 'Noa')
    visit pilots_path

    fill_in 'Search for pilots...', with: 'NA'
    press_enter '#search'

    expect(page).to have_css('tbody tr', count: 1)
  end
end
