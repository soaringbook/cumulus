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

  match "/404", via: :get, to: "errors#show"
  match "/422", via: :get, to: "errors#show"
  match "/500", via: :get, to: "errors#show"
  
  root :to => redirect('/pilots/sign_in')
end
