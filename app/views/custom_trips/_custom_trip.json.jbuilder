json.extract! custom_trip, :id, :destination, :surname, :othernames, :email, :phone_number, :coordination_preference, :group_count, :hotel_type, :trip_duration, :purpose_statement, :comment, :created_at, :updated_at
json.url custom_trip_url(custom_trip, format: :json)
