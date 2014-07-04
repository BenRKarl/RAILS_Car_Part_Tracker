Rails.application.routes.draw do

  get '/' => 'cars#index'

  resources :cars do
    resources :parts
  end

end
