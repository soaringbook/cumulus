Rails.application.routes.draw do
  devise_for :pilots

  authenticated :pilot do
    # Make sure we don't get the authentication message when we didn't login.
    root 'dashboard#index', as: :authenticated_root
  end
  root :to => redirect('/pilots/sign_in')
end
