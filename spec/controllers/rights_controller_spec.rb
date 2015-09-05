require 'rails_helper'

describe RightsController do
  before { bypass_rescue }

  context 'Not authenticated' do
    let(:pilot) { create(:pilot) }

    it { should redirect_for_login { get :index } }
    it { should redirect_for_login { get :edit, pilot_id: pilot.id } }
    it { should redirect_for_login { put :update, pilot_id: pilot.id } }
  end

  context 'Authenticated' do
    shared_examples_for :writable do
      it { should render_template_name('index') { get :index } }
      it { should render_template_name('edit') { get :edit, pilot_id: @pilot.id } }
      it { should redirect_to_path(rights_path) { put :update, pilot_id: @pilot.id, pilot: { admin: true } } }
    end

    context 'Has pilots' do
      before { sign_in create(:pilot, admin: true) }

      context 'Strong params' do
        it { should permit(:admin, :glider_access).for(:update, params: { pilot_id: @pilot.id }) }
      end
    end

    context 'Has no pilots' do
      before { sign_in create(:pilot, admin: true) }

      context 'Templates' do
        it { expect { get :edit, pilot_id: 0 }.to raise_exception(ActiveRecord::RecordNotFound) }
        it { expect { get :update, pilot_id: 0, pilot: {} }.to raise_exception(ActiveRecord::RecordNotFound) }
      end
    end

    context 'Authorizations' do
      context 'With admin rights' do
        before { sign_in create(:pilot, admin: true) }
        it_behaves_like :writable
      end

      context 'Without access' do
        before { sign_in create(:pilot) }

        it { expect { get :index }.to raise_exception(CanCan::AccessDenied) }
        it { expect { get :edit, pilot_id: @pilot.id }.to raise_exception(CanCan::AccessDenied) }
        it { expect { put :update, pilot_id: @pilot.id, pilots: {} }.to raise_exception(CanCan::AccessDenied) }
      end
    end
  end

  context 'Routing' do
    it { should route(:get, '/rights').to(action: :index) }
    it { should route(:get, '/pilots/1/rights/edit').to(action: :edit, pilot_id: 1) }
    it { should route(:put, '/pilots/1/rights').to(action: :update, pilot_id: 1) }
  end
end
