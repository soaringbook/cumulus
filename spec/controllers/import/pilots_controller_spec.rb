require 'rails_helper'

describe Import::PilotsController do
  before { bypass_rescue }

  context 'Not authenticated' do
    it { should redirect_for_login { get :show, id: :upload } }
    it { should redirect_for_login { put :show, id: :review } }
    it { should redirect_for_login { put :show, id: :result } }
  end

  context 'Authenticated' do
    shared_examples_for :writable do
      it { should render_template_name('upload') { get :show, id: :upload } }
      it { should render_template_name('upload') { get :show, id: :review } }
      it { should render_template_name('upload') { get :show, id: :result } }

      it { should render_template_name('review') { put :update, id: :review, import_object: { csv: csv_upload('pilots_all_valid') } } }
      it { should render_template_name('upload') { put :update, id: :review, import_object: { csv: csv_upload('pilots_empty') } } }
      it { should render_template_name('result') { put :update, id: :result, review: { records: {} } } }
    end

    shared_examples_for :no_access do
      it { expect { get :show, id: :upload }.to raise_exception(CanCan::AccessDenied) }
      it { expect { get :show, id: :review }.to raise_exception(CanCan::AccessDenied) }
      it { expect { get :show, id: :result }.to raise_exception(CanCan::AccessDenied) }
    end

    context 'Authorizations' do
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
        it_behaves_like :no_access
      end

      context 'Without access' do
        before { sign_in create(:pilot) }
        it_behaves_like :no_access
      end
    end
  end

  context 'Routing' do
    it { should route(:get, '/import/pilots').to(action: :index) }
    it { should route(:get, '/import/pilots/upload').to(action: :show, id: :upload) }
    it { should route(:get, '/import/pilots/review').to(action: :show, id: :review) }
    it { should route(:get, '/import/pilots/result').to(action: :show, id: :result) }
    it { should route(:put, '/import/pilots/review').to(action: :update, id: :review) }
    it { should route(:put, '/import/pilots/result').to(action: :update, id: :result) }

    it { should_not route(:post, '/import/pilots').to(action: :create) }
    it { should_not route(:delete, '/import/pilots/upload').to(action: :destroy, id: :upload) }
    it { should_not route(:delete, '/import/pilots/review').to(action: :destroy, id: :upload) }
    it { should_not route(:delete, '/import/pilots/result').to(action: :destroy, id: :upload) }
  end
end
