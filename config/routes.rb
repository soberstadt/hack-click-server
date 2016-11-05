Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'dl/*content_path', to: 'deep_link#show'
  get 'deeplink/*content_path', to: 'deep_link#show'
end
