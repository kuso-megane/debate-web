Rails.application.routes.draw do
  
  devise_for :users
  resources :themes do
    resources :opinions
  end
  root to: 'themes#index'
  get '/how_to_use' => 'home#how_to_use'
  get '/about' => 'home#about'
  get '/sample_contribution' => 'home#sample_contribution'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
