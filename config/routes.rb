Rails.application.routes.draw do
  resources :donor_profiles
  resources :blood_types
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'sessions/get_user', to: 'users/sessions#get_user', defaults: {format: :json}
  end
  namespace :api, defaults: {format: :json} do
    resources :donor_profiles, only: [:show,:update]
    resources :blood_types, only: [:index]
    get 'verifications/get_code',to: 'verifications#get_code'
    get 'verifications/confirm',to: 'verifications#confirm'

  end

end
