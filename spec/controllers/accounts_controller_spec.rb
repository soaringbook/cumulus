require 'rails_helper'

describe AccountsController do
  context 'Not authenticated' do
    it { should redirect_for_login { get :show } }
    it { should redirect_for_login { get :edit } }
  end

  context 'Authenticated' do
    before { sign_in create(:pilot, admin: true) }

    it { should redirect_to_path(edit_account_path) { get :show } }
    it { should render_template_name('edit') { get :edit } }
  end

  context 'Routing' do
    it { should route(:get, '/account').to(action: :show) }
    it { should route(:get, '/account/edit').to(action: :edit) }
  end
end
