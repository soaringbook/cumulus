Rails.application.routes.draw do
  ### Payola

  mount Payola::Engine => '/payola', as: :payola

  ### Devise

  as :pilot do
    patch '/pilots/confirmation' => 'confirmations#update', as: :update_pilot_confirmation, via: :patch
  end
  devise_for :pilots, skip: 'registration', :controllers => { :confirmations => "confirmations" }

  devise_scope :pilot do
    # Remove the edit registrations route.
    resource :registration, only: [:new, :create],
                            path: 'pilots',
                            path_names: { new: 'sign_up' },
                            controller: 'registrations',
                            as: :pilot_registration
  end

  ### Dashboard

  authenticated :pilot do
    # Make sure we don't get the authentication message when we didn't login.
    root 'dashboard#show', as: :authenticated_root
  end

  ### Stripe confirmation

  resource :payments, only: [:show]

  ### Gliders

  namespace :import do
    resources :gliders, only: [:index, :show, :update]
  end
  resources :gliders

  ### Pilots

  resources :rights, only: :index
  resources :pilots, only: [] do
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

  root to: redirect('/pilots/sign_in')
end
