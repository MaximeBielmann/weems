Rails.application.routes.draw do
  root "pages#home"
  
  get "/jobs" => "pages#jobs"
  get "/contact" => "pages#contact"
  get "/send-cv" => "pages#sendcv"
end
