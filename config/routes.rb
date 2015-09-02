Rails.application.routes.draw do
  devise_for :pilots, skip: 'registration'

  devise_scope :pilot do
    # Remove the edit registrations route.
    resource :registration, only: [:new, :create],
                            path: 'pilots',
                            path_names: { new: 'sign_up' },
                            controller: 'registrations',
                            as: :pilot_registration
  end

  authenticated :pilot do
    # Make sure we don't get the authentication message when we didn't login.
    root 'dashboard#index', as: :authenticated_root
  end

  namespace :import do
    resources :gliders
  end
  resources :gliders

  %w(404 422 500 503).each do |code|
    get code, to: 'errors#show', code: code
  end

  root to: redirect('/pilots/sign_in')
end
