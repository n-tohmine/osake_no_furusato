class BreweriesController < ApplicationController
  def index
    @q = Brewery.ransack(params[:q])
    @breweries = @q.result(distinct: true).order(id: :asc).page(params[:page])
  end

  def show
    @brewery = Brewery.find(params[:id])
    @longitude = @brewery.longitude
    @latitude = @brewery.latitude
  end
end
