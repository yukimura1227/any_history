json.extract! event, :id, :title, :chronology_id, :year, :month, :category_id, :created_at, :updated_at
json.url event_url(event, format: :json)
