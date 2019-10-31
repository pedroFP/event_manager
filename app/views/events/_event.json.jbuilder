json.extract! event, :id, :category, :name, :description, :price, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
