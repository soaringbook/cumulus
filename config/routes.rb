Rails.application.routes.draw do
  ### Devise

  as :pilot do
    patch '/pilots/confirmation' => 'confirmations#update', as: :update_pilot_confirmation, via: :patch
  end
  devise_for :pilots, path: 'club', controllers: { confirmations: 'confirmations' }

  ### Dashboard

  authenticated :pilot do
    # Make sure we don't get the authentication message when we didn't login.
    root 'dashboard#show', as: :authenticated_root
  end

  ### Import

  namespace :import do
    resources :gliders, only: [:index, :show, :update] do
      get 'csv', on: :collection
    end
    resources :pilots, only: [:index, :show, :update] do
      get 'csv', on: :collection
    end
  end

  ### Clubs

  resources :clubs, except: [:destroy] do
    resources :pilots, only: [:new, :create], controller: 'clubs/pilots'
  end

  ### Gliders

  resources :gliders

  ### Pilots

  resources :rights, only: :index
  resources :pilots do
    resource :rights, only: [:edit, :update]
  end

  ### Profile

  resource :profile, only: [:show, :edit, :update]

  ### Profile

  resource :account, only: [:show, :edit]

  ### Errors

  %w(404 403 422 500 503).each do |code|
    get code, to: 'errors#show', code: code, as: "error_#{code}"
  end

  ### Root

  root to: redirect('/club/sign_in')
end
