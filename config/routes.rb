require 'sidekiq/web'

Rails.application.routes.draw do

    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

  devise_for :users

  authenticated :user do
    root to: "home#dashboard", as: :authenticated_root
  end

  resources :booking_types
  resources :bookings

  get ":booking_link", to: "users#show", as: :user

  root to: "home#index"
end
