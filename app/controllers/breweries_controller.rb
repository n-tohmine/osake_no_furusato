class BreweriesController < ApplicationController
  def index
    @q = Brewery.ransack(paramsq[:q])
    @brewery = @q.result(distinct: true).order(updated_at: :desc).page(params[:page])
  end

  def show
    @brewery = Brewery.find(id[:params])
    @longitude = @brewery.longitude
    @latitude = @brewery.latitude
  end
end
