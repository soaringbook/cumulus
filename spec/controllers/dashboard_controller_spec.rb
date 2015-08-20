require 'rails_helper'

describe DashboardController do
  context 'Templates' do
    it { should render_template_name('index') { get :index } }
  end

  context 'Routing' do
    it { should route(:get, '/').to(action: :index) }
  end
end
