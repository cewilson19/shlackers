PostitTemplate::Application.routes.draw do
  root to: 'posts#index'


  resource :categories, only: [:new, :create]
  resources :posts, except: [:destroy] do
  	resources :comments, only: [:create]
  end

end
