Rails.application.routes.draw do
  resources :messages, only:[:index,:show,:create]
  get 'profiles/add50', to: 'profiles#add50', as: 'add50'
  resources :profiles, only:[:index, :show]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'cars#landing'
  resources :cars, only:[:show, :index, :new, :create, :destroy] do
    get 'denied', to: 'cars#denied'

    resources :reviews, only:[:new, :create]
    resources :bookings do
      get 'accepted', to: 'bookings#accepted'
   end
  end
end
