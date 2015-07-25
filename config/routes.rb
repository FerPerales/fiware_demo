Rails.application.routes.draw do

  root 'chair#index'

  post 'chairs', to: 'chair#update'
  get 'chairs', to: 'chair#index'
end
