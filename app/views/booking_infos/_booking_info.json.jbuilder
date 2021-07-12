json.extract! booking_info, :id, :surname, :othernames, :phone_number, :coordination_preference, :group_count, :hotel_type, :tour_duration, :purpose_statement, :created_at, :updated_at
json.url booking_info_url(booking_info, format: :json)
