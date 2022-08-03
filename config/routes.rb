Rails.application.routes.draw do
  get 'search_from_japanmap', to: 'search_from_japanmap#index'
  root to: 'home#top'
end
