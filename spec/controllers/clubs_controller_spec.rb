require 'rails_helper'

describe ClubsController do
  before { bypass_rescue }

  context 'Not authenticated' do
    let(:club) { create(:club) }

    it { should redirect_for_login { get :index } }
    it { should redirect_for_login { get :new } }
    it { should redirect_for_login { post :create } }
    it { should redirect_for_login { get :show, id: club.id } }
    it { should redirect_for_login { get :edit, id: club.id } }
    it { should redirect_for_login { put :update, id: club.id } }
  end

  context 'Authenticated' do
    shared_examples_for :no_access do
      it { expect { get :index }.to raise_exception(CanCan::AccessDenied) }
      it { expect { get :show, id: club.id }.to raise_exception(CanCan::AccessDenied) }
      it { expect { get :new }.to raise_exception(CanCan::AccessDenied) }
      it { expect { get :edit, id: club.id }.to raise_exception(CanCan::AccessDenied) }
      it { expect { post :create, club: { short_name: nil } }.to raise_exception(CanCan::AccessDenied) }
      it { expect { put :update, id: club.id, club: { short_name: nil } }.to raise_exception(CanCan::AccessDenied) }
    end

    context 'Has clubs' do
      before { sign_in create(:pilot, super_admin: true) }
      let(:club) { create(:club) }

      context 'Strong params' do
        it { should permit(:short_name, :active_until).for(:create, params: { club: { short_name: '' } }).on(:club) }
        it { should permit(:short_name, :active_until).for(:update, params: { id: club, club: { short_name: '' } }).on(:club) }
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

        it { should render_template_name('index') { get :index } }
        it { should render_template_name('new') { get :new } }
        it { should render_template_name('show') { get :show, id: club.id } }
        it { should render_template_name('edit') { get :edit, id: club.id } }

        it { should render_template_name('new') { post :create, club: { short_name: nil } } }
        it { should render_template_name('edit') { put :update, id: club.id, club: { short_name: nil } } }

        it { should redirect_to_path(clubs_path) { post :create, club: { short_name: Faker::Name.name, active_until: Date.today.strftime('%Y-%m-%d') } } }
        it { should redirect_to_path(edit_club_path(club.short_name)) { put :update, id: club.id, club: { short_name: Faker::Name.name } } }
      end
    end
  end

  context 'Routing' do
    it { should route(:get, '/clubs').to(action: :index) }
    it { should route(:get, '/clubs/new').to(action: :new) }
    it { should route(:post, '/clubs').to(action: :create) }
    it { should route(:get, '/clubs/1/edit').to(action: :edit, id: 1) }
    it { should route(:put, '/clubs/1').to(action: :update, id: 1) }
  end
end
