require 'rails_helper.rb'

describe 'The pilot edit flow', type: :feature do
  before { login_as_pilot }

  it 'should create a new pilot' do
    visit new_pilot_path

    fill_in 'Email', with: 'a@a.be'
    fill_in 'First name', with: 'a'
    fill_in 'Last name', with: 'a'
    click_button 'Add Pilot'

    expect(page).to have_content('Pilot was successfully created')
    expect(Pilot.count).to eq(2)
    expect(@pilot.club.pilots.count).to eq(2)
  end

  it 'should fail to create a new pilot' do
    visit new_pilot_path

    click_button 'Add Pilot'

    expect(page).to have_content('can\'t be blank')
    expect(Pilot.count).to eq(1)
    expect(@pilot.club.pilots.count).to eq(1)
  end

  it 'should edit a pilot' do
    pilot = create(:pilot, club: @pilot.club)
    visit edit_pilot_path(pilot)

    fill_in 'First name', with: 'b'
    click_button 'Update Pilot'

    expect(page).to have_content('Pilot was successfully updated')
  end

  it 'should fail to edit a pilot' do
    pilot = create(:pilot, club: @pilot.club)
    visit edit_pilot_path(pilot)

    fill_in 'Email', with: ''
    click_button 'Update Pilot'

    expect(page).to have_content('can\'t be blank')
  end
end
