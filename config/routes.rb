Rails.application.routes.draw do
  root 'rooms#index'
  resources :rooms do
    resources :messages, only: :create
  end
end
