Rails.application.routes.draw do
  resources :ddcs
  resources :attributes
  resources :samples
  resources :create_device_tables

  get 'dashboard', to: 'dashboard#index'

  get 'report', to: 'report#index'

  get 'samples_clear', to: 'samples#clear'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
