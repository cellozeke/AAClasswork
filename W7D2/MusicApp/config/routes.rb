Rails.application.routes.draw do
  resources :users, only: %i[show new create]
  resource :session, only: %i[new create destroy]
  resources :bands do
    resources :albums, only: :new
  end
  resources :albums, except: %i[index new]
end
