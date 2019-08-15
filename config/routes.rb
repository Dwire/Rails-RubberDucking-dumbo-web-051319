Rails.application.routes.draw do
  resources :ducks, only: [:index, :show, :new, :create]
  resources :students, only: [:index, :show, :new, :create]
end
