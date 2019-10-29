Rails.application.routes.draw do
  resources :leads
  resources :firstnames
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'leads#index'
  get '/search' => 'leads#search'
end
