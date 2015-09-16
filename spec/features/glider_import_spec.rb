require 'rails_helper.rb'

describe 'The glider import flow', type: :feature do
  before { login_as_pilot }

  it 'should not import when no file selected' do
    visit import_gliders_path

    click_button 'Upload'

    expect(page).to have_content('can\'t be blank')
  end

  it 'should not import empty an glider csv' do
    visit import_gliders_path

    attach_csv 'Select your CSV file', 'gliders_empty'
    click_button 'Upload'

    expect(page).to have_content('No valid records found')
  end

  it 'should import a valid glider csv' do
    visit import_gliders_path

    attach_csv 'Select your CSV file', 'gliders_all_valid'
    click_button 'Upload'

    expect(page).to have_css('tbody tr .label-success', count: 2)

    click_button 'Import gliders'

    expect(page).to have_content('IMPORT FINISHED')
    expect(Glider.count).to eq(2)
    expect(@pilot.club.gliders.count).to eq(2)
  end

  it 'should import a valid glider csv with an existing glider' do
    create(:glider, immatriculation: 'oo-kdb', club: @pilot.club)
    visit import_gliders_path

    attach_csv 'Select your CSV file', 'gliders_all_valid'
    click_button 'Upload'

    expect(page).to have_css('tbody tr .label-success', count: 1)
    expect(page).to have_css('tbody tr .label-warning', count: 1)

    click_button 'Import gliders'

    expect(page).to have_content('IMPORT FINISHED')
    expect(Glider.count).to eq(2)
    expect(@pilot.club.gliders.count).to eq(2)
  end

  it 'should import an invalid glider csv' do
    visit import_gliders_path

    attach_csv 'Select your CSV file', 'gliders_some_valid'
    click_button 'Upload'

    expect(page).to have_css('tbody tr .label-success', count: 2)
    expect(page).to have_css('tbody tr .label-danger', count: 1)

    click_button 'Import gliders'

    expect(page).to have_content('IMPORT FINISHED')
    expect(Glider.count).to eq(2)
    expect(@pilot.club.gliders.count).to eq(2)
  end
end
