require 'rails_helper'

describe Import::GlidersController do
  before { bypass_rescue }

  context 'Not authenticated' do
    it { should redirect_for_login { get :show, id: :upload } }
    it { should redirect_for_login { put :show, id: :review } }
    it { should redirect_for_login { put :show, id: :result } }
  end

  context 'Authenticated' do
    shared_examples_for 'writable' do
      it { should render_template_name('upload') { get :show, id: :upload } }
      it { should render_template_name('upload') { get :show, id: :review } }
      it { should render_template_name('upload') { get :show, id: :result } }

      it do
        should render_template_name('review') {
          put :update, id: :review, import_object: { csv: csv_upload('gliders_all_valid') }
        }
      end

      it do
        should render_template_name('upload') {
          put :update, id: :review, import_object: { csv: csv_upload('gliders_empty') }
        }
      end

      it do
        should render_template_name('result') {
          put :update, id: :result, review: { records: {} }
        }
      end
    end

    shared_examples_for 'inaccessible' do
      it { expect { get :show, id: :upload }.to raise_exception(CanCan::AccessDenied) }
      it { expect { get :show, id: :review }.to raise_exception(CanCan::AccessDenied) }
      it { expect { get :show, id: :result }.to raise_exception(CanCan::AccessDenied) }
    end

    context 'Has gliders' do
      before { sign_in create(:pilot, admin: true) }

      context 'Templates' do
        it_behaves_like 'writable'
      end
    end

    context 'Authorizations' do
      context 'With admin rights' do
        before { sign_in create(:pilot, admin: true) }
        it_behaves_like 'writable'
      end

      context 'With write access' do
        before { sign_in create(:pilot, glider_access: :gliders_writable) }
        it_behaves_like 'writable'
      end

      context 'With read access' do
        before { sign_in create(:pilot, glider_access: :gliders_readable) }
        it_behaves_like 'inaccessible'
      end

      context 'Without access' do
        before { sign_in create(:pilot) }
        it_behaves_like 'inaccessible'
      end
    end
  end

  context 'Routing' do
    it { should route(:get, '/import/gliders').to(action: :index) }
    it { should route(:get, '/import/gliders/upload').to(action: :show, id: :upload) }
    it { should route(:get, '/import/gliders/review').to(action: :show, id: :review) }
    it { should route(:get, '/import/gliders/result').to(action: :show, id: :result) }
    it { should route(:put, '/import/gliders/review').to(action: :update, id: :review) }
    it { should route(:put, '/import/gliders/result').to(action: :update, id: :result) }

    it { should_not route(:post, '/import/gliders').to(action: :create) }
    it { should_not route(:delete, '/import/gliders/upload').to(action: :destroy, id: :upload) }
    it { should_not route(:delete, '/import/gliders/review').to(action: :destroy, id: :upload) }
    it { should_not route(:delete, '/import/gliders/result').to(action: :destroy, id: :upload) }
  end
end
