Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root  to: 'home#top'
  resources :breweries, only: %i[index show] do
    get 'nearby_hotels', on: :member
    resources :reviews, only: %i[create update destroy], shallow: true
    get 'keeps', on: :collection
  end
  resources :keeps, only: %i[create destroy]
  resources :users
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :password_resets, only: %i[create edit update new]
  get 'search_from_japanmap', to: 'search_from_japanmap#index'
  get 'search_from_liquor_type', to: 'search_from_liquor_type#index'
end
