require 'csv'

csv = CSV.read('db/fixtures/brewery_initial_data.csv')

csv.each do |brewery|
  id = brewery[0]
  name = brewery[1]
  address = brewery[2]
  phone_number = brewery[3]
  prefecture = brewery[4]
  liquor_type = brewery[5].to_i
  website_url = brewery[6]
  latitude = brewery[7]
  longitude = brewery[8]
  place_id = brewery[9]
  photo_reference = brewery[10]

  Brewery.seed do |s|
    s.id = id
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
