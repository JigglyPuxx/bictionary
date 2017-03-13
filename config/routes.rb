Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'

  resources :posts do
  		member do
  			put "like" => "posts#upvote"
  			put "unlike" => "posts#downvote"
  		end
  	resources :comments
  end

end
