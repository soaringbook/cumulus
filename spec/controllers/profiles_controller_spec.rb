require 'rails_helper'

describe ProfilesController do
  before { bypass_rescue }

  context 'Not authenticated' do
    it { should redirect_for_login { get :show } }
    it { should redirect_for_login { get :edit } }
    it { should redirect_for_login { put :update } }
  end

  context 'Authenticated' do
    before { sign_in create(:pilot, admin: true) }

    it { should render_template_name('show') { get :show } }
    it { should render_template_name('edit') { get :edit } }

    it { should redirect_to_path(edit_profile_path) { put :update, pilot: { first_name: 'Jake' } } }
    it { should redirect_to_path(edit_profile_path(tab: 'something')) { put :update, tab: 'something', pilot: { first_name: 'Jake' } } }

    context 'Strong params' do
      it { should permit(:email, :first_name, :last_name, :password, :password_confirmation, :avatar, :remove_avatar, :locale).for(:update, params: { pilot: { first_name: '' } }).on(:pilot) }
    end
  end

  context 'Routing' do
    it { should route(:get, '/profile').to(action: :show) }
    it { should route(:get, '/profile/edit').to(action: :edit) }
    it { should route(:get, '/profile/edit').to(action: :edit) }
  end
end
