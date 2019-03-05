Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cars#index'
  resources :cars, only:[:show, :index, :new, :create] do
    resources :reviews, only:[:new, :create]
  end
end
