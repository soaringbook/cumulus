require 'rails_helper'

describe ErrorsController do
  context 'routing' do
    %w(403 404 422 500 503).each do |code|
      it { should route(:get, "/#{code}").to(action: :show, code: code) }
    end
  end
end
