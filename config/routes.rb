Rails.application.routes.draw do
  root to: 'themes#index'
  resources :themes
  # get 'themes/index'
  # get 'themes/show'
  # get '/how_to_use' => 'home#how_to_use'
  # get '/about' => 'home#about'
  # get '/' => 'home#top'
  # get '/sample_contribution' => 'home#sample_contribution'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
