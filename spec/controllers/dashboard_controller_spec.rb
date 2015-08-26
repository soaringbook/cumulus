require 'rails_helper'

describe DashboardController do
  context 'Not authenticated' do
    it { should redirect_for_login { get :index } }
  end

  context 'Authenticated' do
    before { sign_in create(:pilot) }

    context 'Templates' do
      it { should render_template_name('index') { get :index } }
    end
  end
end
