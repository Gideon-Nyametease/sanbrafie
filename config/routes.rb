Rails.application.routes.draw do
  resources :tours
  resources :booking_infos
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root :to => 'home#landing_page'
  get 'user_dashboard' => 'home#user_dashboard', as: :user_dashboard  
  get 'admin_dashboard' => 'home#admin_dashboard', as: :admin_dashboard
  get 'profile' => 'home#profile', as: :profile
  get 'trips_page' => 'home#trips_page', as: :trips_page
  get 'media_page' => 'home#media_page', as: :media_page
  get 'booking_form' => 'home#booking_form', as: :booking_form
  post 'create_booking' => 'home#create_booking', as: :create_booking
end
