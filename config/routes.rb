Rails.application.routes.draw do
  root 'topics#index'
  devise_for :users
  resources :topics

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
