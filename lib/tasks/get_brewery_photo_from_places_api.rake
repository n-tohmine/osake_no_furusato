require 'open-uri'
require "csv"

namespace :get_brewery_photo_from_places_api do
  desc "PlacesAPIからbreweryの写真を取得、DB保存"
  task brewery_photo: :environment do
    breweries = Brewery.all
    breweries.each do |brewery|
      api_key = Rails.application.credentials.google[:api_key]
      query = URI.encode_www_form(
        photo_reference: brewery.photo_reference,
        maxwidth: 400,
        key: api_key
      )
      place_photo_url = "https://maps.googleapis.com/maps/api/place/photo?#{query}"
  
        #URI.openでplace_photo_urlをダウンロードしてimage変数に格納
        #File.openをwb引数付きで呼び〜.jpgファイルをバイナリ形式で開く
        #image.readでダウンロードした画像データを取り出す(参照する)
        #file.putsで開いたファイルに画像ファイルを流し込む
      begin
        URI.open(place_photo_url) { |image|
          File.open("app/assets/images/main_for_#{brewery.id}.jpg", 'wb') do |file|
            file.puts image.read
          end
        }
      rescue OpenURI::HTTPError => e
        puts "no_image"
      end
      brewery.update(image: "main_for_#{brewery.id}.jpg")
    end
  end
end

namespace :get_single_brewery_photo_from_places_api do
  desc "PlacesAPIから1箇所のbreweryの写真を取得、DB保存"
  task brewery_photo: :environment do
    brewery = Brewery.find(204)
      api_key = Rails.application.credentials.google[:api_key]
      query = URI.encode_www_form(
        photo_reference: brewery.photo_reference,
        maxwidth: 400,
        key: api_key
      )
      place_photo_url = "https://maps.googleapis.com/maps/api/place/photo?#{query}"

      begin
        URI.open(place_photo_url) { |image|
          File.open("app/assets/images/main_for#{brewery.id}.jpg", 'wb') do |file|
            file.puts image.read
          end
        }
      rescue OpenURI::HTTPError => e
        puts "no_image"
      end
      brewery.update(image: "main_for_#{brewery.id}.jpg")
  end
end