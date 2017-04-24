json.extract! event, :id, :name, :description, :start, :created_at, :updated_at
json.url event_url(event, format: :json)