require 'rails_helper.rb'

describe 'The registration flow', type: :feature do
  before { show_registration_path }

  it 'should register a user' do
    fill_in 'Short name',            with: 'ebbt'
    fill_in 'Email',                 with: 'jake@snake.be'
    fill_in 'Password',              with: '123123123', match: :prefer_exact
    fill_in 'Password confirmation', with: '123123123', match: :prefer_exact
    click_button 'Sign up'

    expect(page).to have_content('Soaring Book')
    expect(Pilot.count).to eq(1)
    expect(Club.count).to eq(1)
    expect(Pilot.first.club.id).to eq(Club.first.id)
  end

  it 'should fail to register a user' do
    fill_in 'Email', with: 'jake@snake.be'
    click_button 'Sign up'

    expect(page).to have_content('Please review the problems below')
    expect(Pilot.count).to eq(0)
    expect(Club.count).to eq(0)
  end

  it 'should fail to register a user when the club is invalid' do
    fill_in 'Email',                 with: 'jake@snake.be'
    fill_in 'Password',              with: '123123123', match: :prefer_exact
    fill_in 'Password confirmation', with: '123123123', match: :prefer_exact
    click_button 'Sign up'

    expect(page).to have_content('Please review the problems below')
    expect(Pilot.count).to eq(0)
    expect(Club.count).to eq(0)
  end

  private

  def show_registration_path
    visit root_path
    click_link 'Create yours now!'
  end
end
