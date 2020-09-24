Rails.application.routes.draw do
  get '/', to: 'homepage#show', as: 'homepage'

  resources :products, only: [:new, :edit, :create, :update, :destroy]
end
