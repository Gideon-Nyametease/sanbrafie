Rails.application.routes.draw do
  devise_for :users
  root :to => 'home#landing_page'
  get 'user_dashboard' => 'home#user_dashboard', as: :user_dashboard  
  get 'admin_dashboard' => 'home#admin_dashboard', as: :admin_dashboard
  get 'login_form' => 'devise/sessions#login_form', as: :login_form
end
