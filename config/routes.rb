Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :messages

  get 'dl/lookup', to: 'lookup#index'
  get 'dl/*content_path', to: 'deep_link#show'
  get 'deeplink/*content_path', to: 'deep_link#show'

  get 'apple-app-site-association', to: 'app_site_association#index'
end
