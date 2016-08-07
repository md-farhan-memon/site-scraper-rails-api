Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      resources :links, only: [:index, :create, :show] do
      end
    end
  end
end
