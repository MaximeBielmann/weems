Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  
  get "/contact" => "pages#contact"
  get "/send-cv" => "pages#sendcv"
  get "/admin" => "pages#admin"
  
  post "jobs" => "jobs#create"
  get "jobs" => "jobs#index"
  get "jobs/:id" => "jobs#show"
  get "jobs/:id/change" => "jobs#change"
  patch "jobs/:id" => "jobs#update"
  delete "jobs/:id" => "jobs#destroy"
end
