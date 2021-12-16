Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'users' do
    resources :signup, only: [:create]
    resources :login, only: [:create]
    resources :users do
      member do
        get :send_referal
      end
    end
  end
end
