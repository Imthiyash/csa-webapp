Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  get "products/export_sales", to: "products#export_sales"

  delete "products", to: "products#destroy", as: "delete_products"

  root "pages#home"

  get "/profile", to: "pages#profile"
  get "/user_list", to: "pages#user_list"
  post "events/:id/start", to: "events#start", as: :start
  post "events/:id/end", to: "events#end", as: :end
  resources :events
  resources :cstrophy
  resources :products
  resources :sales
  resources :announcements

  resources :products do
    collection do
      get :export_sales
    end
  end
end
