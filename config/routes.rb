Rails.application.routes.draw do
  resources :tours
  resources :booking_infos
  devise_for :users
  root :to => 'home#landing_page'
  get 'user_dashboard' => 'home#user_dashboard', as: :user_dashboard  
  get 'admin_dashboard' => 'home#admin_dashboard', as: :admin_dashboard
  get 'profile' => 'home#profile', as: :profile
  get 'trips_page' => 'home#trips_page', as: :trips_page
  get 'media_page' => 'home#media_page', as: :media_page
  get 'login_form' => 'devise/sessions#login_form', as: :login_form
end
