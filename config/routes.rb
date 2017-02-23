Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  root 'topics#index'
  resources :users, only: [:index, :show]
  resources :relationships, only: [:create, :destroy]
  resources :topics do
    resources :comments

    collection do
      post :confirm
    end
  end
end
