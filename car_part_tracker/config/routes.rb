Rails.application.routes.draw do

  get '/' => 'cars#index'

  resources :cars
  resources :parts
end
