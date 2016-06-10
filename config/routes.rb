Rails.application.routes.draw do
  root 'gangs#index'

  resources :gangs do
    resources :thugs
  end
end
