class HotelsSearchService
  def initialize(brewery)
    @brewery = brewery
  end

  def nearby_hotels
    make_api_response
  end

  private

  def make_api_request
    require 'uri'
    require 'net/http'
    require 'openssl'

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

    @http = Net::HTTP.new(url.host, url.port)
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    @request = Net::HTTP::Get.new(url)
    @request['X-RapidAPI-Key'] = api_key
    @request['X-RapidAPI-Host'] = 'booking-com.p.rapidapi.com'
  end

  def make_api_response
    make_api_request # @http,@requestインスタンス作成。
    response = @http.request(@request)
    JSON.parse(response.body)
  end
end
