Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/swagger-ui'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :v1 do
    post 'send-code', to: 'auth#send_sms'
    post 'login', to: 'auth#login'
    post 'logout', to: 'auth#logout'

    resources :users, only: %i[show update destroy]
  end

  # get 'up' => 'rails/health#show', as: :rails_health_check
  get 'ping', to: 'home#ping'
  root to: 'home#root'
end
