Rails.application.routes.draw do
  resources :user_testimonials
  resources :custom_trips
  resources :customer_msgs
  resources :tours
  resources :booking_infos
  post 'checkout/create', to: 'checkout#create'
  resources :webhooks, only: [:create]
  # post 'webhooks/create', to: 'webhooks#create'
  # post 'create' => 'checkout#create', as: :checkout_create

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root :to => 'home#landing_page'
  # =========== error pages =========================
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  match "/504", to: "errors#timed_out", via: :all
  match "/422", to: "errors#unacceptable", via: :all
  # ====================================================
  get 'user_dashboard' => 'home#user_dashboard', as: :user_dashboard  
  get 'admin_dashboard' => 'home#admin_dashboard', as: :admin_dashboard
  get 'profile' => 'home#profile', as: :profile
  get 'trips_page' => 'home#trips_page', as: :trips_page
  get 'media_page' => 'home#media_page', as: :media_page
  get 'booking_form' => 'home#booking_form', as: :booking_form
  get 'booking_form2' => 'home#booking_form2', as: :booking_form2
  post 'create_booking' => 'home#create_booking', as: :create_booking
  post 'create_msg' => 'home#create_msg', as: :create_msg
  get 'payment_form' => 'booking_infos#payment_form', as: :payment_form
  get 'book_form' => 'tours#book_form', as: :book_form
  get 'postpone_booking' => 'booking_infos#postpone_booking', as: :postpone_booking
  get 'booking_details' => 'home#booking_details', as: :booking_details
  get 'checkout_page' => 'home#checkout_page', as: :checkout_page
  get 'custom_trip_form' => 'home#custom_trip_form', as: :custom_trip_form
  post 'create_custom_trip' => 'home#create_custom_trip', as: :create_custom_trip
  get 'tos' => 'home#tos', as: :tos
  get 'testimonial_form' => 'home#testimonial_form', as: :testimonial_form
  post 'create_testimonial' => 'home#create_testimonial', as: :create_testimonial
  get 'privacy_policy' => 'home#privacy_policy', as: :privacy_policy
  get 'upcoming_trips_modal' => 'home#upcoming_trips_modal', as: :upcoming_trips_modal

  get 'success_page' => 'home#success_page', as: :success_page
end
