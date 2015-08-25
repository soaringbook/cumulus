require 'rails_helper'

describe ErrorsController do
  context 'routing' do
    it { should route(:get, '/404').to(action: :show, code: '404') }
    it { should route(:get, '/422').to(action: :show, code: '422') }
    it { should route(:get, '/500').to(action: :show, code: '500') }
    it { should route(:get, '/503').to(action: :show, code: '503') }
  end
end
