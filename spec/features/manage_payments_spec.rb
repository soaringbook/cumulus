require 'rails_helper.rb'

describe 'The manage payments flow', type: :feature do
  before do
    setup_plan
    login_as_pilot
  end

  it 'should show the payments cancel page' do
    allow_any_instance_of(ApplicationController).to receive(:subscription_valid?).and_return(true)
    allow_any_instance_of(ApplicationController).to receive_message_chain(:subscription_valid?).and_return(true)
    allow_any_instance_of(ApplicationController).to receive_message_chain(:current_subscription, :state).and_return 'active'
    allow_any_instance_of(ApplicationController).to receive_message_chain(:current_subscription, :trial_end).and_return nil
    allow_any_instance_of(ApplicationController).to receive_message_chain(:current_subscription, :active?).and_return true
    allow_any_instance_of(ApplicationController).to receive_message_chain(:current_subscription, :guid).and_return '123'

    visit edit_account_path

    expect(page).to have_content('Edit club account')
    expect(page).to have_content('Cancel Subscription')
    expect(page).to_not have_content('Trial')
  end

  it 'should show the payments cancel page with trial data' do
    allow_any_instance_of(ApplicationController).to receive(:subscription_valid?).and_return(true)
    allow_any_instance_of(ApplicationController).to receive_message_chain(:current_subscription, :state).and_return 'active'
    allow_any_instance_of(ApplicationController).to receive_message_chain(:current_subscription, :trial_end).and_return(Time.now + 2.days)
    allow_any_instance_of(ApplicationController).to receive_message_chain(:current_subscription, :active?).and_return true
    allow_any_instance_of(ApplicationController).to receive_message_chain(:current_subscription, :guid).and_return '123'

    visit edit_account_path

    expect(page).to have_content('Edit club account')
    expect(page).to have_content('Cancel Subscription')
    expect(page).to have_content('Trial')
  end

  it 'should show the payments page with subscripption buttons' do
    allow_any_instance_of(ApplicationController).to receive(:subscription_valid?).and_return(false)
    allow_any_instance_of(ApplicationController).to receive_message_chain(:current_subscription, :state).and_return 'cancelled'
    allow_any_instance_of(ApplicationController).to receive_message_chain(:current_subscription, :active?).and_return false
    allow_any_instance_of(ApplicationController).to receive_message_chain(:current_subscription, :guid).and_return '123'

    visit edit_account_path

    expect(page).to have_content('Edit club account')
    expect(page).to have_content('Subscribe')
    expect(page).to_not have_content('Trial')
  end
end
