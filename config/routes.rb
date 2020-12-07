Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'test/index'
  namespace :api do
    namespace :v1 do
      get 'clients', to: 'clients#index'
      get 'clients/:external_client_id', to: 'clients#show'
      get 'clients/:external_client_id/payments', to: 'clients#payments'
      get 'clients/:external_client_id/payments/:payment_id/transactions', to: 'clients#transactions'
      get 'clients/:external_client_id/received_money', to: 'clients#received_money'
      get 'clients/:external_client_id/money_to_receive', to: 'clients#money_to_receive'
    end
  end
end
