json.extract! aircraft, :id, :name, :model, :tail_number, :status, :created_at, :updated_at
json.url aircraft_url(aircraft, format: :json)
