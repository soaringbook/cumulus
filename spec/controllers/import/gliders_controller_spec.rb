require 'rails_helper'

describe Import::GlidersController do
  context 'Not authenticated' do
    it { should redirect_for_login { get :show, id: :upload } }
    it { should redirect_for_login { put :show, id: :review } }
    it { should redirect_for_login { put :show, id: :result } }
  end

  context 'Authenticated' do
    context 'Has gliders' do
      before { sign_in create(:pilot) }

      context 'Templates' do
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
