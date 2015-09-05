require 'rails_helper.rb'

describe 'The glider edit flow', type: :feature do
  before do
    @pilot = create(:pilot, admin: true)
    login_as(@pilot, scope: :pilot)
  end

  it 'should create a new glider' do
    visit new_glider_path

    fill_in 'Immatriculation', with: 'OO-KDB'
    fill_in 'Type', with: 'Janus'
    click_button 'Add Glider'

    expect(page).to have_content('Glider was successfully created')
    expect(Glider.count).to eq(1)
    expect(@pilot.club.gliders.count).to eq(1)
  end

  it 'should fail to create a new glider' do
    visit new_glider_path

    fill_in 'Immatriculation', with: 'OO-KDB'
    click_button 'Add Glider'

    expect(page).to have_content('can\'t be blank')
    expect(Glider.count).to eq(0)
    expect(@pilot.club.gliders.count).to eq(0)
  end

  it 'should edit a glider' do
    glider = create(:glider, club: @pilot.club)
    visit edit_glider_path(glider)

    fill_in 'Type', with: 'Janus'
    click_button 'Update Glider'

    expect(page).to have_content('Glider was successfully updated')
  end

  it 'should fail to edit a glider' do
    glider = create(:glider, club: @pilot.club)
    visit edit_glider_path(glider)

    fill_in 'Type', with: ''
    click_button 'Update Glider'

    expect(page).to have_content('can\'t be blank')
  end
end
