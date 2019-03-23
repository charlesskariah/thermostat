Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :readings, only: [:create, :show] do
        collection do
          get :statistics
        end
      end
    end
  end
end
