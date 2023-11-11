Rails.application.routes.draw do
  root to: 'home#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  namespace :api do
    namespace :v1 do
      # around user
      # add users prefix
      post 'users/sign_up', to: 'sessions#sign_up'
      post 'users/activate', to: 'sessions#activate'
      post 'users/sign_in', to: 'sessions#sign_in'
      delete 'users/logout', to: 'sessions#logout'
      post 'users/request_password_reset', to: 'sessions#request_password_reset'
      post 'users/password_reset', to: 'sessions#password_reset'
      get 'users/me', to: 'sessions#me'

      resources :posts, only: [:index, :create] do
        collection do
          get 'count_keyword'
        end
      end
    end
  end
end
