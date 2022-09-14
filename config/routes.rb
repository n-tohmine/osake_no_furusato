Rails.application.routes.draw do
  root  to: 'home#top'
  resources :breweries, only: %i[index show]
  get 'search_from_japanmap', to: 'search_from_japanmap#index'
  
end
