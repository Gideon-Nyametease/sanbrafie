Rails.application.routes.draw do
  resources :customer_msgs
  resources :tours
  resources :booking_infos
  post 'checkout/create', to: 'checkout#create'
  # post 'create' => 'checkout#create', as: :checkout_create

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root :to => 'home#landing_page'
  get 'user_dashboard' => 'home#user_dashboard', as: :user_dashboard  
  get 'admin_dashboard' => 'home#admin_dashboard', as: :admin_dashboard
  get 'profile' => 'home#profile', as: :profile
  get 'trips_page' => 'home#trips_page', as: :trips_page
  get 'media_page' => 'home#media_page', as: :media_page
  get 'booking_form' => 'home#booking_form', as: :booking_form
  post 'create_booking' => 'home#create_booking', as: :create_booking
  post 'create_msg' => 'home#create_msg', as: :create_msg
  get 'payment_form' => 'booking_infos#payment_form', as: :payment_form
  get 'book_form' => 'tours#book_form', as: :book_form
  get 'postpone_booking' => 'booking_infos#postpone_booking', as: :postpone_booking
  get 'booking_details' => 'home#booking_details', as: :booking_details
  get 'checkout_page' => 'home#checkout_page', as: :checkout_page
end
