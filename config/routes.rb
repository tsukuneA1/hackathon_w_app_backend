Rails.application.routes.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show]
    end
  end
end