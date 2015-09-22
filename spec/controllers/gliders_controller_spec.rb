require 'rails_helper'

describe GlidersController do
  before { bypass_rescue }

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
    shared_examples_for :writable do
      it { should render_template_name('index') { get :index } }
      it { should render_template_name('new') { get :new } }
      it { should render_template_name('show') { get :show, id: glider.id } }
      it { should render_template_name('edit') { get :edit, id: glider.id } }

      it { should render_template_name('new') { post :create, glider: { name: nil } } }
      it { should render_template_name('edit') { put :update, id: glider.id, glider: { name: nil } } }

      it { should redirect_to_path(new_glider_path) { post :create, glider: { immatriculation: Faker::Name.name, name: Faker::Name.name } } }
      it { should redirect_to_path(edit_glider_path(glider.immatriculation)) { put :update, id: glider.id, glider: { name: Faker::Name.name } } }
      it { should redirect_to_path(gliders_path) { delete :destroy, id: glider.id } }
    end

    context 'Has gliders' do
      before { sign_in create(:pilot, admin: true) }
      let(:glider) { create(:glider, club: @pilot.club) }

      context 'Strong params' do
        it { should permit(:immatriculation, :name, :self_launching, :double_seater, :avatar, :remove_avatar, :external).for(:create) }
        it { should permit(:immatriculation, :name, :self_launching, :double_seater, :avatar, :remove_avatar, :external).for(:update, params: { id: glider.id }) }
      end
    end

    context 'Has no gliders' do
      before { sign_in create(:pilot, admin: true) }
      let(:glider) { create(:glider) }

      context 'Templates' do
        it { expect { get :show, id: glider.id }.to raise_exception(ActiveRecord::RecordNotFound) }
        it { expect { get :edit, id: glider.id }.to raise_exception(ActiveRecord::RecordNotFound) }
        it { expect { get :update, id: glider.id, glider: { name: nil } }.to raise_exception(ActiveRecord::RecordNotFound) }
      end
    end

    context 'Authorizations' do
      let(:glider) { create(:glider, club: @pilot.club) }

      context 'With admin rights' do
        before { sign_in create(:pilot, admin: true) }
        it_behaves_like :writable
      end

      context 'With write access' do
        before { sign_in create(:pilot, glider_access: :gliders_writable) }
        it_behaves_like :writable
      end

      context 'With read access' do
        before { sign_in create(:pilot, glider_access: :gliders_readable) }

        it { should render_template_name('index') { get :index } }
        it { should render_template_name('show') { get :show, id: glider.id } }

        it { expect { get :new }.to raise_exception(CanCan::AccessDenied) }
        it { expect { get :edit, id: glider.id }.to raise_exception(CanCan::AccessDenied) }
        it { expect { post :create, glider: { name: nil } }.to raise_exception(CanCan::AccessDenied) }
        it { expect { put :update, id: glider.id, glider: { name: nil } }.to raise_exception(CanCan::AccessDenied) }
        it { expect { delete :destroy, id: glider.id }.to raise_exception(CanCan::AccessDenied) }
      end

      context 'Without access' do
        before { sign_in create(:pilot) }

        it { expect { get :index }.to raise_exception(CanCan::AccessDenied) }
        it { expect { get :show, id: glider.id }.to raise_exception(CanCan::AccessDenied) }
        it { expect { get :new }.to raise_exception(CanCan::AccessDenied) }
        it { expect { get :edit, id: glider.id }.to raise_exception(CanCan::AccessDenied) }
        it { expect { post :create, glider: { name: nil } }.to raise_exception(CanCan::AccessDenied) }
        it { expect { put :update, id: glider.id, glider: { name: nil } }.to raise_exception(CanCan::AccessDenied) }
        it { expect { delete :destroy, id: glider.id }.to raise_exception(CanCan::AccessDenied) }
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
