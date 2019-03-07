Rails.application.routes.draw do
  get 'profiles/add50', to: 'profiles#add50', as: 'add50'
  resources :profiles, only:[:index, :show]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'cars#landing'
  resources :cars, only:[:show, :index, :new, :create, :destroy] do
    resources :reviews, only:[:new, :create]
    get "top", to: "cars#top"
  end
end
