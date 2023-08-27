class NearbyHotelsController < ApplicationController
  skip_before_action :require_login

  def index
    @brewery = Brewery.find(params[:id])
    hotels_search_service = HotelsSearchService.new(@brewery)
    @hotels = hotels_search_service.nearby_hotels

    render 'breweries/nearby_hotels'
  end
end
