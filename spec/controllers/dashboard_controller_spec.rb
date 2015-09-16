require 'rails_helper'

describe DashboardController do
  context 'Not authenticated' do
    it { should redirect_for_login { get :show } }
  end

  context 'Authenticated' do
    before { sign_in create(:pilot) }

    context 'Templates' do
      it { should render_template_name('show') { get :show } }
    end
  end
end
