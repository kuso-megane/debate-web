Rails.application.routes.draw do
  
  get 'posts/opinion_post'
  get 'posts/theme_post'
  resources:theme
  
  get 'posts/theme_post' => 'posts#theme_post' 
  get 'posts/opinion_post' => 'posts#opinion_post'
  get '/how_to_use' => 'home#how_to_use'
  get '/about' => 'home#about'
  get '/' => 'home#top'
  get '/sample_contribution' => 'home#sample_contribution'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
