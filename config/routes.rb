Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  
  resources "contacts", only: [:new, :create]
  resources "candidatures", only: [:new, :create]
  
  root "pages#home"
  
  get "/contacts" => "contacts#new"
  get "/send-cv" => "pages#sendcv"
  get "/admin" => "pages#admin"
  get "/about-us" => "pages#aboutus"
  
  post "jobs" => "jobs#create"
  get "jobs" => "jobs#index"
  get "jobs/:id" => "jobs#show"
  get "jobs/:id/change" => "jobs#change"
  patch "jobs/:id" => "jobs#update"
  delete "jobs/:id" => "jobs#destroy"
  get "jobs/:id/apply" => "jobs#apply"
  
  get "/candidatures" => "candidatures#new"
end
