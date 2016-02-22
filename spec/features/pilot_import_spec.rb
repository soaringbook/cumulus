require 'rails_helper.rb'

describe 'The pilot import flow', type: :feature do
  before { login_as_pilot }

  it 'should not import when no file selected' do
    visit import_pilots_path

    click_button 'Upload'

    expect(page).to have_content('can\'t be blank')
  end

  it 'should not import empty an pilot csv' do
    visit import_pilots_path

    attach_csv 'Select your CSV file', 'pilots_empty'
    click_button 'Upload'

    expect(page).to have_content('No valid records found')
  end

  it 'should import a valid pilot csv' do
    visit import_pilots_path

    attach_csv 'Select your CSV file', 'pilots_all_valid'
    click_button 'Upload'

    expect(page).to have_css('tbody tr .label-success', count: 2)

    click_button 'Import'

    expect(page).to have_content('IMPORT FINISHED')
    expect(Pilot.count).to eq(3)
    expect(@pilot.club.pilots.count).to eq(3)
  end

  it 'should import a valid pilot csv with an existing pilot' do
    create(:pilot, email: 'a@a.be', club: @pilot.club)
    visit import_pilots_path

    attach_csv 'Select your CSV file', 'pilots_all_valid'
    click_button 'Upload'

    expect(page).to have_css('tbody tr .label-success', count: 1)
    expect(page).to have_css('tbody tr .label-warning', count: 1)

    click_button 'Import'

    expect(page).to have_content('IMPORT FINISHED')
    expect(Pilot.count).to eq(3)
    expect(@pilot.club.pilots.count).to eq(3)
  end

  it 'should import an invalid pilot csv' do
    visit import_pilots_path

    attach_csv 'Select your CSV file', 'pilots_some_valid'
    click_button 'Upload'

    expect(page).to have_css('tbody tr .label-success', count: 2)
    expect(page).to have_css('tbody tr .label-danger', count: 1)

    click_button 'Import'

    expect(page).to have_content('IMPORT FINISHED')
    expect(Pilot.count).to eq(3)
    expect(@pilot.club.pilots.count).to eq(3)
  end
end
