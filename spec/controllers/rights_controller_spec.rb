require 'rails_helper'

describe RightsController do
  context 'Not authenticated' do
    let(:pilot) { create(:pilot) }

    it { should redirect_for_login { get :index } }
    it { should redirect_for_login { get :edit, pilot_id: pilot.id } }
    it { should redirect_for_login { put :update, pilot_id: pilot.id } }
  end

  context 'Authenticated' do
    context 'Has pilots' do
      before { sign_in create(:pilot) }

      context 'Templates' do
        it { should render_template_name('index') { get :index } }
        #         it { should render_template_name('edit') { get :edit, pilot_id: @pilot.id } }

        #         it { should render_template_name('edit') { put :update, pilot_id: @pilot.id, pilot: { } } }
      end

      context 'Redirects' do
        #         it { should redirect_to_path(glider_path(glider.immatriculation)) { put :update, id: glider.id, glider: { name: Faker::Name.name } } }
      end

      context 'Strong params' do
        it { should permit(:admin, :glider_access).for(:update, params: { pilot_id: @pilot.id }) }
      end
    end

    context 'Has no pilots' do
      before { sign_in create(:pilot) }

      context 'Templates' do
        it { expect { get :edit, pilot_id: 0 }.to raise_exception(ActiveRecord::RecordNotFound) }
        it { expect { get :update, pilot_id: 0, pilot: {} }.to raise_exception(ActiveRecord::RecordNotFound) }
      end
    end
  end

  context 'Routing' do
    it { should route(:get, '/rights').to(action: :index) }
    it { should route(:get, '/pilots/1/rights/edit').to(action: :edit, pilot_id: 1) }
    it { should route(:put, '/pilots/1/rights').to(action: :update, pilot_id: 1) }
  end
end
