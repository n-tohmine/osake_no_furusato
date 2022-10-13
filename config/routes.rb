Rails.application.routes.draw do
  root  to: 'home#top'
  resources :breweries, only: %i[index show] do
    get 'nearby_hotels',on: :member
  end
  get 'search_from_japanmap', to: 'search_from_japanmap#index'
  get 'search_from_liquor_type', to: 'search_from_liquor_type#index'
  
end
