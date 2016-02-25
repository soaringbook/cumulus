require 'rails_helper.rb'

describe 'The club edit flow', type: :feature do
  before { login_as_pilot create(:pilot, super_admin: true) }

  it 'should create a new club' do
    visit new_club_path

    fill_in 'Abbreviation', with: 'aaa'
    fill_in 'Active until', with: '20-02-2017'
    click_button 'Add Club'

    expect(page).to have_content('Club was successfully created')
    expect(Club.count).to eq(2)
  end

  it 'should fail to create a new club' do
    visit new_club_path

    click_button 'Add Club'

    expect(page).to have_content('can\'t be blank')
    expect(Club.count).to eq(1)
  end

  it 'should edit a club' do
    club = create(:club)
    visit edit_club_path(club)

    fill_in 'Abbreviation', with: 'bbb'
    click_button 'Update Club'

    expect(page).to have_content('Club was successfully updated')
  end

  it 'should fail to edit a pilot' do
    club = create(:club)
    visit edit_club_path(club)

    fill_in 'Abbreviation', with: ''
    click_button 'Update Club'

    expect(page).to have_content('can\'t be blank')
  end
end
