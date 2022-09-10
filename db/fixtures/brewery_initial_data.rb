require 'csv'

csv = CSV.read('db/fixtures/brewery_initial_data.csv')

csv.each do |brewery|
  name = brewery[0]
  address = brewery[1]
  phone_number = brewery[2]
  prefecture = brewery[3]
  liquor_type = brewery[4].to_i
  website_url = brewery[5]
  latitude = brewery[6]
  longitude = brewery[7]
  place_id = brewery[8]
  photo_reference = brewery[9]

  Brewery.seed do |s|
    s.name = name
    s.address = address
    s.phone_number  = phone_number
    s.prefecture = prefecture
    s.liquor_type = liquor_type
    s.website_url = website_url
    s.latitude = latitude
    s.longitude = longitude
    s.place_id = place_id
    s.photo_reference = photo_reference
  end
end