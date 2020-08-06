Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'login#login'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'my_pets', to: "pets#my_pets"
      resources :pets, only: [:index, :show, :create, :destroy] do
        resources :bookings, only: [:create]
      end
      resources :bookings, only: [:index, :show, :destroy]
    end
  end
end
