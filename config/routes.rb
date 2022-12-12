Rails.application.routes.draw do
  resources :cities
  resources :countries
  devise_for :users
  resources :companies do
    member do 
      get :show_page
    end
  end
  resources :roles
  resources :places
  resources :states
  resources :nodes
  resources :manage
  root "companies#index"
  get "/countries",to: "countries#index"
  delete "/companies/:id/delete",to: "companies#destroy", as: "company_delet"
  get "/roles" ,to: "roles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/manage', to: "manage#index"
  # patch '/:id/edit', to: "manage#edit", as: "manage_edit"
  # get 'manage/new', to: "manage#new"  
  get '/get_states_based_country', to: "states#get_states_based_country"
  get '/get_cities', to: "cities#get_cities"
end
  