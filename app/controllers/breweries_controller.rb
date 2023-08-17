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

  def nearby_hotels
    require 'uri'
    require 'net/http'
    require 'openssl'

    @brewery = Brewery.find(params[:id])
    api_key = Rails.application.credentials.rapid_booking[:api_key]
    checkin_date = Date.today.next_month
    checkout_date = checkin_date + 1

    query = URI.encode_www_form(
      checkin_date: checkin_date,
      checkout_date: checkout_date,
      longitude: @brewery.longitude,
      latitude: @brewery.latitude
    )

    url = URI("https://booking-com.p.rapidapi.com/v1/hotels/search-by-coordinates?order_by=distance&adults_number=1&units=metric&room_number=1&filter_by_currency=JPY&locale=ja&page_number=0&include_adjacency=true&#{query}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request['X-RapidAPI-Key'] = api_key
    request['X-RapidAPI-Host'] = 'booking-com.p.rapidapi.com'
    response = http.request(request)
    response_json = JSON.parse(response.body)

    @hotels = response_json
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
