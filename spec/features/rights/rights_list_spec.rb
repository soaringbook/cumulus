require 'rails_helper.rb'

describe 'The rights list flow', type: :feature do
  before { login_as_pilot }

  it 'should see an empty placeholder', js: true do
    visit rights_path

    fill_in 'Search for pilots...', with: 'ak'
    press_enter '#search'

    expect(page).to have_content('No pilots found')
  end

  it 'should see a list with rights' do
    create(:pilot, club: @pilot.club)
    visit rights_path

    expect(page).to_not have_content('No pilots found')
    expect(page).to have_css('tbody tr', count: 2)
  end

  it 'should only see pilots from my club' do
    create(:pilot, club: @pilot.club)
    create(:pilot)
    visit rights_path

    expect(page).to have_css('tbody tr', count: 2)
  end

  it 'should be able to search the pilots', js: true do
    create(:pilot, email: 'jelly@fousa.be', club: @pilot.club)
    create(:pilot, email: 'jake@fousa.be',  club: @pilot.club)
    visit rights_path

    fill_in 'Search for pilots...', with: 'ak'
    press_enter '#search'

    expect(page).to have_css('tbody tr', count: 1)
  end

  it 'should be able to search the pilots from my club only', js: true do
    create(:pilot, email: 'jelly@fousa.be', club: @pilot.club)
    create(:pilot, email: 'jake@fousa.be',  club: @pilot.club)
    create(:pilot, email: 'jelly2@fousa.be')
    create(:pilot, email: 'jake2@fousa.be')
    visit rights_path

    fill_in 'Search for pilots...', with: 'ak'
    press_enter '#search'

    expect(page).to have_css('tbody tr', count: 1)
  end
end
