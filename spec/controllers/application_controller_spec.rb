require 'rails_helper'

describe ApplicationController do
  controller do
    def dummy
      render text: 'This is a dummy controller'
    end
  end

  before do
    @routes.draw do
      get '/anonymous/dummy'
    end
  end

  context 'Not authenticated' do
    it { should redirect_for_login { get :dummy } }
  end

  context 'Authenticated' do
    before { sign_in create(:pilot) }
    it { should_not redirect_for_login { get :dummy } }

    it 'should get the correct club' do
      get :dummy
      expect(controller.current_club).to eq(@pilot.club)
    end
  end

  context 'Locale' do
    it 'should get the default locale' do
      sign_in create(:pilot)
      get :dummy
      expect(I18n.locale).to eq(:en)
    end

    it 'should get the pilot\'s locale' do
      sign_in create(:pilot, locale: :nl)
      get :dummy
      expect(I18n.locale).to eq(:nl)
    end
  end
end
