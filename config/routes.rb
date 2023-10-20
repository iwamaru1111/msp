Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'posts/top' =>'posts#top'
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  root 'posts#top'
end