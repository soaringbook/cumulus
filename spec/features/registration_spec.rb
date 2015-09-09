require 'rails_helper.rb'

describe 'The registration flow', type: :feature do
  before do
    clear_emails
    show_registration_path
  end

  it 'should register a user' do
    fill_in 'Club abbreviation (ex. BZC)', with: 'ebbt'
    fill_in 'Email',                       with: 'jake@snake.be'
    click_button 'Create yours'

    expect(page).to have_content('confirmation link')

    expect(Pilot.count).to eq(1)
    expect(Club.count).to eq(1)
    expect(Pilot.first.club.id).to eq(Club.first.id)
    expect(Pilot.first.admin?).to be_truthy

    open_email('jake@snake.be')
    expect(current_email).to have_content 'Confirm'
  end

  it 'should fail to register a user' do
    fill_in 'Email', with: 'jake@snake.be'
    click_button 'Create yours'

    expect(page).to have_content("can't be blank")
    expect(Pilot.count).to eq(0)
    expect(Club.count).to eq(0)
  end

  it 'should fail to register a user when the club is invalid' do
    fill_in 'Email',            with: 'jake@snake.be'
    click_button 'Create yours'

    expect(page).to have_content("can't be blank")
    expect(Pilot.count).to eq(0)
    expect(Club.count).to eq(0)
  end

  private

  def show_registration_path
    visit root_path
    click_link 'Create yours now!'
  end
end
