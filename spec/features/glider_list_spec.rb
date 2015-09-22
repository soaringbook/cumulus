require 'rails_helper.rb'

describe 'The glider list flow', type: :feature do
  before { login_as_pilot }

  it 'should see an empty placeholder' do
    visit gliders_path

    expect(page).to have_content('No gliders found')
  end

  it 'should see a list with gliders' do
    create(:glider, club: @pilot.club)
    visit gliders_path

    expect(page).to_not have_content('No gliders found')
    expect(page).to have_css('tbody tr', count: 1)
  end

  it 'should only see gliders from my club' do
    create(:glider, club: @pilot.club)
    create(:glider)
    visit gliders_path

    expect(page).to have_css('tbody tr', count: 1)
  end

  it 'should be able to search the gliders', js: true do
    create(:glider, immatriculation: 'OO-NAM', club: @pilot.club)
    create(:glider, immatriculation: 'OO-NO', club: @pilot.club)
    visit gliders_path

    fill_in 'Search for gliders...', with: 'NA'
    press_enter '#search'

    expect(page).to have_css('tbody tr', count: 1)
  end

  it 'should be able to search the gliders', js: true do
    create(:glider, immatriculation: 'OO-NAM', club: @pilot.club)
    create(:glider, immatriculation: 'OO-NO', club: @pilot.club)
    create(:glider, immatriculation: 'OO-NAMA')
    create(:glider, immatriculation: 'OO-NOA')
    visit gliders_path

    fill_in 'Search for gliders...', with: 'NA'
    press_enter '#search'

    expect(page).to have_css('tbody tr', count: 1)
  end
end
