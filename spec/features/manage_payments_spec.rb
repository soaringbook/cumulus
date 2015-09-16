require 'rails_helper.rb'

describe 'The manage payments flow', type: :feature do
  before { login_as_pilot }

  it 'should show the payments cancel page' do
    ApplicationController.any_instance.stub(:subscription_valid?).and_return true
    ApplicationController.any_instance.stub_chain(:current_subscription, :state).and_return 'active'
    ApplicationController.any_instance.stub_chain(:current_subscription, :trial_end).and_return nil
    ApplicationController.any_instance.stub_chain(:current_subscription, :active?).and_return true
    ApplicationController.any_instance.stub_chain(:current_subscription, :guid).and_return '123'

    visit edit_account_path

    expect(page).to have_content('Edit club account')
    expect(page).to have_content('Cancel Subscription')
    expect(page).to_not have_content('Trial')
  end

  it 'should show the payments cancel page with trial data' do
    ApplicationController.any_instance.stub(:subscription_valid?).and_return true
    ApplicationController.any_instance.stub_chain(:current_subscription, :state).and_return 'active'
    ApplicationController.any_instance.stub_chain(:current_subscription, :trial_end).and_return(Time.now + 2.days)
    ApplicationController.any_instance.stub_chain(:current_subscription, :active?).and_return true
    ApplicationController.any_instance.stub_chain(:current_subscription, :guid).and_return '123'

    visit edit_account_path

    expect(page).to have_content('Edit club account')
    expect(page).to have_content('Cancel Subscription')
    expect(page).to have_content('Trial')
  end

  it 'should show the payments page with subscripption buttons' do
    ApplicationController.any_instance.stub(:subscription_valid?).and_return false
    ApplicationController.any_instance.stub_chain(:current_subscription, :state).and_return 'cancelled'
    ApplicationController.any_instance.stub_chain(:current_subscription, :active?).and_return false
    ApplicationController.any_instance.stub_chain(:current_subscription, :guid).and_return '123'

    visit edit_account_path

    expect(page).to have_content('Edit club account')
    expect(page).to have_content('Subscribe')
    expect(page).to_not have_content('Trial')
  end
end
