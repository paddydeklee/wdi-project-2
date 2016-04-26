Rails.application.routes.draw do
  root 'statics#home'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:index, :show, :edit, :update] do
    resources :enquiries
  end

  resources :consultations do
    resources :treatments
  end

  get "/doctors", to: "users#doctors"

  get "/unassigned", to: "consultations#unassigned_cases"
  get "/cases_as_doctor", to: "consultations#cases_as_doctor"
  get "/cases_as_patient", to: "consultations#cases_as_patient"

  get "/inbox", to: "enquiries#inbox"
  get "/outbox", to: "enquiries#outbox"

  get "/pending_treatments", to: "treatments#pending_treatments"

  resources :enquiries, only: [] do 
    member do
      get "accept"
      get "reject"
      get "cancel"
    end
  end

  resources :consultations , only: [] do 
    member do
      get "accept"
    end
  end

  resources :comments, only: [:create, :destroy]
  
end


