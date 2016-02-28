require 'rails_helper'

describe Clubs::PilotsController do
  before { bypass_rescue }

  context 'Not authenticated' do
    let(:club) { create(:club) }

    it { should redirect_for_login { get :new, club_id: club.id } }
    it { should redirect_for_login { post :create, club_id: club.id } }
  end

  context 'Authenticated' do
    shared_examples_for :no_access do
      it { expect { get :new, club_id: club.id }.to raise_exception(CanCan::AccessDenied) }
      it { expect { post :create, club_id: club.id, pilot: { first_name: '' } }.to raise_exception(CanCan::AccessDenied) }
    end

    context 'Has clubs' do
      before { sign_in create(:pilot, super_admin: true) }
      let(:club) { create(:club) }

      context 'Strong params' do
        it { should permit(:email, :first_name, :last_name).for(:create, params: { format: :js, club_id: club.id, pilot: { first_name: '' } }).on(:pilot) }
      end
    end

    context 'Authorizations' do
      let(:club) { create(:club) }

      context 'With admin rights' do
        before { sign_in create(:pilot, admin: true) }
        it_behaves_like :no_access
      end

      context 'Without admin rights' do
        before { sign_in create(:pilot) }
        it_behaves_like :no_access
      end

      context 'With super admin rights' do
        before { sign_in create(:pilot, super_admin: true) }

        it { should render_template_name('new') { get :new, club_id: club.id } }
        it { should render_template_name('create') { post :create, format: :js, club_id: club.id, pilot: { first_name: '' } } }
      end
    end
  end

  context 'Routing' do
    it { should route(:get, '/clubs/1/pilots/new').to(action: :new, club_id: '1') }
    it { should route(:post, '/clubs/1/pilots').to(action: :create, club_id: '1') }
  end
end
