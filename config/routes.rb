Rails.application.routes.draw do
  devise_for :pilots

  root 'dashboard#index'
end
