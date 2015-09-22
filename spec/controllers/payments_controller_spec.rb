require 'rails_helper'

describe PaymentsController do
  context 'Not authenticated' do
    it { should redirect_for_login { get :show } }
  end

  context 'Authenticated' do
    it do
      sign_in create(:pilot, admin: true), false
      should render_template_name('show') { get :show }
    end

    it do
      sign_in create(:pilot, admin: true)
      should redirect_to_path(edit_account_path) { get :show }
    end
  end

  context 'Routing' do
    it { should route(:get, '/payments').to(action: :show) }
  end
end
