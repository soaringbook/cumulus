require 'rails_helper'

describe PilotsController do
  before { bypass_rescue }

  context 'Not authenticated' do
    let(:pilot) { create(:pilot) }

    it { should redirect_for_login { get :index } }
    it { should redirect_for_login { get :new } }
    it { should redirect_for_login { post :create } }
    it { should redirect_for_login { get :show, id: pilot.id } }
    it { should redirect_for_login { get :edit, id: pilot.id } }
    it { should redirect_for_login { put :update, id: pilot.id } }
    it { should redirect_for_login { delete :destroy, id: pilot.id } }
  end

  context 'Authenticated' do
    shared_examples_for :writable do
      it { should render_template_name('index') { get :index } }
      it { should render_template_name('new') { get :new } }
      it { should render_template_name('show') { get :show, id: pilot.id } }
      it { should render_template_name('edit') { get :edit, id: pilot.id } }

      it { should render_template_name('new') { post :create, pilot: { email: nil } } }
      it { should render_template_name('edit') { put :update, id: pilot.id, pilot: { email: nil } } }

      it { should redirect_to_path(new_pilot_path) { post :create, pilot: { email: Faker::Internet.email, first_name: Faker::Name.name, last_name: Faker::Name.name } } }
      it { should redirect_to_path(edit_pilot_path(pilot)) { put :update, id: pilot.id, pilot: { first_name: Faker::Name.name } } }
      it { should redirect_to_path(pilots_path) { delete :destroy, id: pilot.id } }
    end

    context 'Has pilots' do
      before { sign_in create(:pilot, admin: true) }
      let(:pilot) { create(:pilot, club: @pilot.club) }

      context 'Strong params' do
        it { should permit(:first_name, :last_name, :avatar, :remove_avatar).for(:create) }
        it { should permit(:first_name, :last_name, :avatar, :remove_avatar).for(:update, params: { id: pilot.id }) }
      end
    end

    context 'Authorizations' do
      let(:pilot) { create(:pilot, club: @pilot.club) }

      context 'With admin rights' do
        before { sign_in create(:pilot, admin: true) }
        it_behaves_like :writable
      end

      context 'With write access' do
        before { sign_in create(:pilot, pilot_access: :pilots_writable) }
        it_behaves_like :writable
      end

      context 'With read access' do
        before { sign_in create(:pilot, pilot_access: :pilots_readable) }

        it { should render_template_name('index') { get :index } }
        it { should render_template_name('show') { get :show, id: pilot.id } }

        it { expect { get :new }.to raise_exception(CanCan::AccessDenied) }
        it { expect { get :edit, id: pilot.id }.to raise_exception(CanCan::AccessDenied) }
        it { expect { post :create, pilot: { name: nil } }.to raise_exception(CanCan::AccessDenied) }
        it { expect { put :update, id: pilot.id, pilot: { name: nil } }.to raise_exception(CanCan::AccessDenied) }
        it { expect { delete :destroy, id: pilot.id }.to raise_exception(CanCan::AccessDenied) }
      end

      context 'Without access' do
        before { sign_in create(:pilot) }

        it { expect { get :index }.to raise_exception(CanCan::AccessDenied) }
        it { expect { get :show, id: pilot.id }.to raise_exception(CanCan::AccessDenied) }
        it { expect { get :new }.to raise_exception(CanCan::AccessDenied) }
        it { expect { get :edit, id: pilot.id }.to raise_exception(CanCan::AccessDenied) }
        it { expect { post :create, pilot: { first_name: nil } }.to raise_exception(CanCan::AccessDenied) }
        it { expect { put :update, id: pilot.id, pilot: { first_name: nil } }.to raise_exception(CanCan::AccessDenied) }
        it { expect { delete :destroy, id: pilot.id }.to raise_exception(CanCan::AccessDenied) }
      end
    end
  end

  context 'Routing' do
    it { should route(:get, '/pilots').to(action: :index) }
    it { should route(:get, '/pilots/new').to(action: :new) }
    it { should route(:post, '/pilots').to(action: :create) }
    it { should route(:get, '/pilots/1/edit').to(action: :edit, id: 1) }
    it { should route(:put, '/pilots/1').to(action: :update, id: 1) }
    it { should route(:delete, '/pilots/1').to(action: :destroy, id: 1) }
  end
end
