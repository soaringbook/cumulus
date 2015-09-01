require 'rails_helper'

describe GlidersController do
  context 'Not authenticated' do
    let(:glider) { create(:glider) }

    it { should redirect_for_login { get :index } }
    it { should redirect_for_login { get :new } }
    it { should redirect_for_login { post :create } }
    it { should redirect_for_login { get :show, id: glider.id } }
    it { should redirect_for_login { get :edit, id: glider.id } }
    it { should redirect_for_login { put :update, id: glider.id } }
    it { should redirect_for_login { delete :destroy, id: glider.id } }
  end

  context 'Authenticated' do
    context 'Has gliders' do
      before { sign_in create(:pilot) }
      let(:glider) { create(:glider, club: @pilot.club) }

      context 'Templates' do
        it { should render_template_name('index') { get :index } }
        it { should render_template_name('new') { get :new } }
        it { should render_template_name('show') { get :show, id: glider.id } }
        it { should render_template_name('edit') { get :edit, id: glider.id } }

        it { should render_template_name('new') { post :create, glider: { name: nil } } }
        it { should render_template_name('edit') { put :update, id: glider.id, glider: { name: nil } } }
      end

      context 'Redirects' do
        it do
          immatriculation = Faker::Name.name
          should redirect_to_path(glider_path(immatriculation.parameterize)) { post :create, glider: { immatriculation: immatriculation, name: Faker::Name.name } }
        end
        it { should redirect_to_path(glider_path(glider.immatriculation)) { put :update, id: glider.id, glider: { name: Faker::Name.name } } }
        it { should redirect_to_path(gliders_path) { delete :destroy, id: glider.id } }
      end

      context 'Strong params' do
        it { should permit(:immatriculation, :name, :self_launching, :double_seater, :avatar).for(:create) }
        it { should permit(:immatriculation, :name, :self_launching, :double_seater, :avatar).for(:update, params: { id: glider.id }) }
      end
    end

    context 'Has no gliders' do
      before { sign_in create(:pilot) }
      let(:glider) { create(:glider) }

      context 'Templates' do
        it { expect { get :show, id: glider.id }.to raise_exception(ActiveRecord::RecordNotFound) }
        it { expect { get :edit, id: glider.id }.to raise_exception(ActiveRecord::RecordNotFound) }
        it { expect { get :update, id: glider.id, glider: { name: nil } }.to raise_exception(ActiveRecord::RecordNotFound) }
      end
    end
  end

  context 'Routing' do
    it { should route(:get, '/gliders').to(action: :index) }
    it { should route(:get, '/gliders/new').to(action: :new) }
    it { should route(:post, '/gliders').to(action: :create) }
    it { should route(:get, '/gliders/1/edit').to(action: :edit, id: 1) }
    it { should route(:put, '/gliders/1').to(action: :update, id: 1) }
    it { should route(:delete, '/gliders/1').to(action: :destroy, id: 1) }
  end
end
