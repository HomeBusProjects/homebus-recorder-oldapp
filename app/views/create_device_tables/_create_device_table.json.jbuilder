json.extract! create_device_table, :id, :nickname, :street_address, :city, :state, :postal_code, :longitude, :latitude, :api_key, :created_at, :updated_at
json.url create_device_table_url(create_device_table, format: :json)
