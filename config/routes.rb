Rails.application.routes.draw do
  get 'render/index'
  devise_for :users

  resources :clients do
    resources :calls  # Esto anida las rutas de llamadas bajo clientes
  end

  resources :reasons
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "clients#index"
end
