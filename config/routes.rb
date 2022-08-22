Rails.application.routes.draw do
  root  to: 'home#top'
  get 'breweries/index',      to: 'breweries#index'
  get 'breweries/show',       to: 'breweries#show'
  get 'search_from_japanmap', to: 'search_from_japanmap#index'
  
end
