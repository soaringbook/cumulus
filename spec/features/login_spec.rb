require 'rails_helper.rb'

describe 'The login flow', type: :feature do
  before do
    @pilot = create(:pilot, password: '123123123', password_confirmation: '123123123')

    visit root_path
  end

  it 'should login' do
    fill_in 'Email', with: @pilot.email
    fill_in 'Password', with: '123123123'
    click_button 'Log in'

    expect(page).to have_content('Soaring Book')
  end

  it 'should fail to login' do
    fill_in 'Email', with: 'jake@snake.be'
    fill_in 'Password', with: '123123123'
    click_button 'Log in'

    expect(page).to have_content('Invalid email or password')
  end
end
