Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  get '/sitemap', to: redirect("https://#{Rails.application.credentials[:aws][:S3_sitemap_bucket_name]}.s3.ap-northeast-1.amazonaws.com/sitemap.xml.gz")

  root to: 'home#top'
  resources :breweries, only: %i[index show] do
    get 'nearby_hotels', on: :member, to: 'nearby_hotels#index'
    resources :reviews, only: %i[create update destroy], shallow: true
    collection do
      get 'keeps'
      get 'likes'
    end
  end
  resources :keeps, only: %i[create destroy]
  resources :likes, only: %i[create destroy]
  resources :users
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :password_resets, only: %i[create edit update new]
  get 'search_from_japanmap', to: 'search_from_japanmap#index'
  get 'search_from_liquor_type', to: 'search_from_liquor_type#index'
  get 'contacts_new', to: 'contacts#new'
  post 'contacts_confirm', to: 'contacts#confirm'
  post 'contacts_done', to: 'contacts#done'
end
