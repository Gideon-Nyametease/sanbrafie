json.extract! tour, :id, :tour_id, :title, :description, :start_date, :end_date, :created_at, :updated_at
json.url tour_url(tour, format: :json)
