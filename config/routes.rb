Rails.application.routes.draw do
  scope '/api/v1' do
    resources :users, only: %i[index show]
  end
end