Rails.application.routes.draw do
  root 'statics#home'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:index, :show, :edit, :update] do
      resources :enquiries
  end

  resources :consultations 

  get "/doctors", to: "users#doctors"


  get "/inbox", to: "enquiries#inbox"
  get "/outbox", to: "enquiries#outbox"


  resources :enquiries, only: [] do 
      member do
          get "accept"
          get "reject"
          get "cancel"
      end
  end
end

