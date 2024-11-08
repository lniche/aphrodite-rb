Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/swagger-ui'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    # 用户认证相关路由
    post 'send-code', to: 'auth#send_sms'
    post 'login', to: 'auth#login'
    post 'logout', to: 'auth#logout'

    # 用户管理相关路由
    resources :users, only: %i[show update destroy]
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get 'service-worker' => 'rails/pwa#service_worker', as: :pwa_service_worker
  get 'manifest' => 'rails/pwa#manifest', as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
