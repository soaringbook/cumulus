require 'rails_helper.rb'

describe 'The password forget flow', type: :feature do
  before do 
    @pilot = create(:pilot)

    clear_emails
    show_reset_path
  end

  it 'should send reset instructions' do
    fill_in 'Email', with: @pilot.email
    click_button 'Send me reset password instructions'

    expect(page).to have_content('Sign in')
    
    open_email(@pilot.email)
    expect(current_email).to have_content('Change my password')
  end

  it 'should fail to send reset instructions' do
    fill_in 'Email', with: 'jake@snake.be'
    click_button 'Send me reset password instructions'

    expect(page).to have_content('Please review the problems below')
    expect(current_email).to be_nil
  end

  private

  def show_reset_path
    visit root_path
    click_link 'Forgot password?'
  end
end
