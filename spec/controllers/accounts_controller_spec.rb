require 'rails_helper'

describe AccountsController do
  context 'Not authenticated' do
    it { should redirect_for_login { get :show } }
    it { should redirect_for_login { get :edit } }
    it { should redirect_for_login { put :update } }
  end

  context 'Authenticated' do
    before { sign_in create(:pilot, admin: true) }

    it { should redirect_to_path(edit_account_path) { get :show } }
    it { should render_template_name('edit') { get :edit } }

    it { should redirect_to_path(edit_account_path) { put :update, club: { short_name: 'BBT' } } }
    it { should redirect_to_path(edit_account_path(tab: 'something')) { put :update, tab: 'something', club: { short_name: 'BBT' } } }

    context 'Strong params' do
      it { should permit(:short_name).for(:update, params: { club: { short_name: '' } }).on(:club) }
    end
  end

  context 'Routing' do
    it { should route(:get, '/account').to(action: :show) }
    it { should route(:get, '/account/edit').to(action: :edit) }
    it { should route(:put, '/account').to(action: :update) }
  end
end
