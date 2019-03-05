Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cars#landing'
  resources :cars, only:[:show, :index] do
    resources :reviews, only:[:new, :create]
    get "top", to: "cars#top"
  end
end
