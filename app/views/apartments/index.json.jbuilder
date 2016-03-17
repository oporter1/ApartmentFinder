json.array!(@apartments) do |apartment|
  json.extract! apartment, :id, :latitude, :longitude, :address, :name, :contact
  json.url apartment_url(apartment, format: :json)
end
