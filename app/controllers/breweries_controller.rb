class BreweriesController < ApplicationController
  before_action :set_brewery, only: %i[show]
  skip_before_action :require_login

  def index
    @q = Brewery.ransack(params[:q])
    @breweries = @q.result(distinct: true).order(id: :asc).page(params[:page])
  end

  def show
    @longitude = @brewery.longitude
    @latitude = @brewery.latitude
    @review = Review.new
    @reviews = @brewery.reviews.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
  end

  def likes
    @like_breweries = current_user.like_breweries.order(created_at: :desc).page(params[:page]).per(5)
  end

  def keeps
    @keep_breweries = current_user.keep_breweries.order(created_at: :desc).page(params[:page]).per(5)
  end

  private

  def set_brewery
    @brewery = Brewery.find(params[:id])
  end
end
